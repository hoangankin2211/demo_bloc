import 'package:demo_bloc/auth/bloc/login_bloc.dart';
import 'package:demo_bloc/auth/bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.blueGrey, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Default Username: test"),
                        Text("Default Password: test")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Bloc Application Demo",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text(
                "Username",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: const InputDecoration(isDense: true),
                controller: username,
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(isDense: true),
                controller: password,
              ),
              const SizedBox(height: 20),
              BlocBuilder<LoginBloc, MapEntry<String, bool>>(
                  builder: (context, state) {
                if (state.key == "check") {
                  if (state.value == false) {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(),
                    );
                  } else {}
                }
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginEvent(
                          password: password.text, username: username.text));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 45)),
                    child: state.key == "isLoading" && state.value == true
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : const Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                  ),
                );
              })
            ],
          ),
        ),
      )),
    );
  }
}
