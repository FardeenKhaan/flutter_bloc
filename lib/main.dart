import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/auth_login/login_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_practice/screens/authentication/login_screen.dart';
import 'package:flutter_bloc_practice/screens/counter_home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => CounterBloc(),
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: false),
        home: const LoginScreen(),
      ),
    );
  }
}
