import 'package:demo_bloc/login/bloc/login_bloc.dart';
import 'package:demo_bloc/login/bloc/login_event.dart';
import 'package:demo_bloc/login/bloc/login_state.dart';
import 'package:demo_bloc/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (!state.isAuthenticated) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Home Screen",
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
              TextButton.icon(
                  onPressed: () {
                    context.read<LoginBloc>().add(LogoutEvent());
                  },
                  icon: const Icon(Icons.logout_outlined),
                  label: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
