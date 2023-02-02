import '../model/user.dart';

abstract class LoginEvent {}

class SubmitFormLogin extends LoginEvent {
  final User user;
  SubmitFormLogin({required this.user});
}

class LogoutEvent extends LoginEvent {}
