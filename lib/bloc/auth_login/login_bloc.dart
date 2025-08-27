import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/auth_login/login_event.dart';
import 'package:flutter_bloc_practice/bloc/auth_login/login_state.dart';
import 'package:flutter_bloc_practice/data/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _authRepository = AuthRepository();
  LoginBloc() : super(LoginState.initializeState()) {
    on<loginUserEvents>(_loginUser);
  }

  Future<void> _loginUser(loginUserEvents event, Emitter<LoginState> emit) async {
    try {
      /// loading
      emit(state.copyWith(isLoading: true, iSuccess: false));

      /// login the user
      _authRepository.loginUser(event.username, event.password);

      /// stop loaing
      emit(state.copyWith(isLoading: false, iSuccess: true));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
