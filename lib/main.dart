import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = CounterCubit(10);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: TextButton(
          child: const Text("Click"),
          onPressed: () {
            counterCubit.increment();
            print(counterCubit.state);
          },
        ),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
  }

  void increment() => emit(state + 10);
}
