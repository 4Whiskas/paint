import 'package:stacked/stacked.dart';
import 'package:template/domain/services/auth_service.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel({
    required this.authService,
  });

  final AuthService authService;

  Future<void> onReady() async {}
}
