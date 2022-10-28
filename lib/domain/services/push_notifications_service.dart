import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:template/data/data_sources/push/remote_push_ds.dart';
import 'package:template/gen/colors.gen.dart';

class PushNotificationsService {
  PushNotificationsService(
    this.firebaseMessaging,
    this._ds,
  );
  final FirebaseMessaging firebaseMessaging;
  final RemotePushDataSource _ds;

  late final String packageName;
  Future<void> fetchVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    packageName = packageInfo.packageName;
  }

  late final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final _androidChannel = const AndroidNotificationChannel(
    'notify',
    'Уведомление в приложении',
    description: 'Уведомляет о важном событии',
    importance: Importance.high,
  );
  late final NotificationDetails _platformChannelSpecifics =
      NotificationDetails(
    android: AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      importance: Importance.max,
      priority: Priority.high,
      ledOnMs: 500,
      ledOffMs: 200,
      groupKey: '$packageName.NOTIFICATION',
      visibility: NotificationVisibility.public,
      enableLights: true,
      icon: '@drawable/ic_stat_vector',
      ledColor: ColorName.white,
    ),
    iOS: const DarwinNotificationDetails(
      presentBadge: true,
      presentAlert: true,
      presentSound: true,
    ),
  );

  Future<void> init() async {
    await fetchVersionInfo();
    await _flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: const AndroidInitializationSettings(
          '@drawable/ic_stat_vector',
        ),
        iOS: DarwinInitializationSettings(
          onDidReceiveLocalNotification: (id, title, body, payload) =>
              _onSelectNotificationFromLocal(payload),
        ),
      ),
      //onSelectNotification: _onSelectNotificationFromLocal,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await FirebaseMessaging.instance.requestPermission(
      announcement: true,
    );

    fromTerminated();
    FirebaseMessaging.onMessage.listen(_isNeedShow);
    // FirebaseMessaging.onBackgroundMessage(_showNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(_onSelectNotificationFromFcm);

    final token = await FirebaseMessaging.instance.getToken();
    onToken(token);
    FirebaseMessaging.instance.onTokenRefresh.listen(onToken);
  }

  void onToken(String? token) {
    if (token == null) return;
    _ds.setToken(token);
  }

  void _isNeedShow(RemoteMessage message) {
    if (message.notification != null) {
      _showNotification(message);
      return;
    }
  }

  Future<void> _showNotification(RemoteMessage message) async {
    await FirebaseMessaging.instance.requestPermission();
    String title = message.notification?.title ?? '';
    String body = message.notification?.body ?? '';
    final int id = DateTime.now().millisecondsSinceEpoch % 100000;
    _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _platformChannelSpecifics,
      payload: jsonEncode(message.data),
    );
  }

  Future<void> _onSelectNotificationFromLocal(String? payload) async {
    if (payload == null) return;
    onMessageTap(jsonDecode(payload));
  }

  Future<void> fromTerminated() async {
    final message = await FirebaseMessaging.instance.getInitialMessage();
    if (message == null) return;

    if (message.notification != null) {
    } else {}
  }

  Future<void> _onSelectNotificationFromFcm(RemoteMessage message) async {
    onMessageTap(message.data);
  }

  Future<void> onMessageTap(Map<String, dynamic>? data) async {
    //TODO(whiskas4): implement on Tap Message
  }

  Future<void> changeToken() async {
    return FirebaseMessaging.instance.deleteToken();
  }
}
