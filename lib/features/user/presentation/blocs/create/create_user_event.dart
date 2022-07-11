part of 'create_user_bloc.dart';

abstract class CreateUserEvent extends Equatable {
  const CreateUserEvent();
}

class CreateUser extends CreateUserEvent {
  final CreateUserEntity createEntity;
  const CreateUser(this.createEntity);

  @override
  List<Object> get props => [];
}