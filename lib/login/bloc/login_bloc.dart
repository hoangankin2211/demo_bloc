import 'package:bloc/bloc.dart';
import 'package:demo_bloc/login/bloc/login_event.dart';
import 'package:demo_bloc/login/bloc/login_state.dart';
import 'package:demo_bloc/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(super.initialState) {
    on<SubmitFormLogin>(_checkAuth);
    on<LogoutEvent>(logoutHandle);
  }
  void _checkAuth(SubmitFormLogin event, Emitter<LoginState> emit) {
    if (event.user.username != DefaultAccount.username ||
        event.user.password != DefaultAccount.password) {
      emit(LoginState(false, null));
    }
    emit(LoginState(true, event.user));
  }

  void logoutHandle(LogoutEvent event, Emitter<LoginState> emit) {
    emit(LoginState(false, null));
  }
}
