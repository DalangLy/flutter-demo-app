part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class StartLogin extends LoginEvent {
  final Login login;
  const StartLogin(this.login);

  @override
  List<Object> get props => [];
}