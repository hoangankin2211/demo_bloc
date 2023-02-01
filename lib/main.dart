import 'package:bloc/bloc.dart';
import 'package:demo_bloc/auth/bloc/login_bloc.dart';
import 'package:demo_bloc/auth/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultAccount {
  static const String username = "test";
  static const String password = "test";
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc(10);
    final counterCubit = CounterCubit(0);

    Bloc.observer = SimpleBlocObserver();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Scaffold(
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         TextButton(
      //           child: const Text("Cubit"),
      //           onPressed: () {
      //             counterCubit.increment();
      //           },
      //         ),
      //         TextButton(
      //           child: const Text("Bloc"),
      //           onPressed: () {
      //             bloc.add(CounterIncrementPressed());
      //             bloc.stream.listen(print);
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      home: BlocProvider(
        create: (context) => LoginBloc(const MapEntry("isLoading", false)),
        child: LoginScreen(),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  void increment() => emit(state + 10);
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("onTransition in SimpleBlocObserver");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('SimpleBlocObserver ${bloc.runtimeType}');
  }
}

abstract class CounterEvent {}

class CounterIncrementPressed implements CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState) {
    on((event, emit) {
      emit(state * 10);
    });
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print("onTransition in CounterBloc");
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print("Counter Bloc onChange");
  }
}
