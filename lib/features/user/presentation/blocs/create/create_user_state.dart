part of 'create_user_bloc.dart';

abstract class CreateUserState extends Equatable {
  const CreateUserState();
}

class CreateUserInitial extends CreateUserState {
  @override
  List<Object> get props => [];
}

class CreateUserInProgress extends CreateUserState {
  @override
  List<Object> get props => [];
}

class CreateUserSuccess extends CreateUserState {
  @override
  List<Object> get props => [];
}

class CreateUserFailed extends CreateUserState {
  final String message;
  const CreateUserFailed(this.message);

  @override
  List<Object> get props => [];
}
