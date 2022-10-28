import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:paint/domain/services/auth_service.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel({
    required this.authService,
  });

  final AuthService authService;
  final TextEditingController pinController = TextEditingController();

  bool faceIdAvailavle = false;
  bool touchIdAvailable = false;

  Future<void> onReady() async {
    await authService.init();
    faceIdAvailavle = authService.availableBiometrics.contains(BiometricType.face);
    touchIdAvailable = authService.availableBiometrics.contains(BiometricType.fingerprint);
    notifyListeners();
  }

  Future<void> onPinFilled(String res) async {
    notifyListeners();
    await authService.login(res);
  }

  Future<void> authViaBiometric() async {
    await authService.loginViaBiometrics();
  }

  void incrementPin(String char) {
    pinController.text += char;
  }

  void cancelInput() {
    pinController.clear();
  }
}
