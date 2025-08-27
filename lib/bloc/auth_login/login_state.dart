import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  LoginState({required this.isLoading, required this.isSuccess});

  LoginState copyWith({bool? isLoading, bool? iSuccess}) {
    return LoginState(isLoading: isLoading ?? this.isLoading, isSuccess: iSuccess ?? this.isSuccess);
  }

  static LoginState initializeState() {
    return LoginState(isLoading: false, isSuccess: false);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, isSuccess];
}
