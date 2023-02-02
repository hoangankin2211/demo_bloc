import '../model/user.dart';

class LoginState {
  bool isAuthenticated;
  User? user;
  LoginState(this.isAuthenticated, this.user);
}
