import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:paint/data/data_sources/auth/local_auth_ds.dart';
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
  bool successLogin = true;

  bool get hasAccount => authService.authState != AuthState.passwordNotSet;

  Future<void> onReady() async {
    await authService.init();
    faceIdAvailavle = authService.availableBiometrics.contains(BiometricType.face);
    touchIdAvailable = authService.availableBiometrics.contains(BiometricType.fingerprint);
    notifyListeners();
  }

  Future<void> onPinFilled(String res) async {
    successLogin = false;
    notifyListeners();
    if (authService.authState == AuthState.passwordNotSet) {
      setPassword(res);
    }
    successLogin = await authService.login(res);
    notifyListeners();
  }

  Future<void> authViaBiometric() async {
    await authService.loginViaBiometrics();
  }

  void setPassword(String pwd) {
    authService.setPassword(pwd);
  }

  void incrementPin(String char) {
    pinController.text += char;
  }

  void cancelInput() {
    successLogin = true;
    pinController.clear();
    notifyListeners();
  }
}
