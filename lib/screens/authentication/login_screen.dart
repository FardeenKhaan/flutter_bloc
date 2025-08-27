import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/auth_login/login_bloc.dart';
import 'package:flutter_bloc_practice/bloc/auth_login/login_event.dart';
import 'package:flutter_bloc_practice/bloc/auth_login/login_state.dart';
import 'package:flutter_bloc_practice/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _username;
  late final TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.isSuccess != current.isSuccess,
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login Screen')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to the Login Screen'),
              const SizedBox(height: 16),
              TextField(
                controller: _username,
                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _password,
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(loginUserEvents(username: _username.text, password: _password.text));
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    if (state.isLoading) {
                      return CircularProgressIndicator();
                    }
                    return Text('Login');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
