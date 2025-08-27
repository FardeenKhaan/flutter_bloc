import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class loginUserEvents extends LoginEvent {
  final String username;
  final String password;

  loginUserEvents({required this.username, required this.password});
}
