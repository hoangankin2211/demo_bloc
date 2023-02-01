import 'package:bloc/bloc.dart';
import 'package:demo_bloc/auth/bloc/login_event.dart';
import 'package:demo_bloc/main.dart';

class LoginBloc extends Bloc<LoginEvent, MapEntry<String, bool>> {
  bool isLoading = false;
  LoginBloc(super.initialState) {
    on((event, emit) async {
      if (event is LoginEvent) {
        emit(const MapEntry("isLoading", true));
        await Future.delayed(
          const Duration(seconds: 3),
          () => emit(const MapEntry("isLoading", false)),
        );

        emit(MapEntry('check', _checkAuth(event.username, event.password)));
      }
    });
  }

  bool _checkAuth(String? username, String? password) {
    if (username != DefaultAccount.username ||
        password != DefaultAccount.password) {
      return false;
    }
    return true;
  }
}
