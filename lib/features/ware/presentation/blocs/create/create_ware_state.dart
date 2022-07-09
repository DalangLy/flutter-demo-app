part of 'create_ware_bloc.dart';

abstract class CreateWareState extends Equatable {
  const CreateWareState();
}

class CreateWareInitial extends CreateWareState {
  @override
  List<Object> get props => [];
}

class CreateWareInProgress extends CreateWareState {
  @override
  List<Object> get props => [];
}

class CreateWareSuccess extends CreateWareState {
  @override
  List<Object> get props => [];
}

class CreateWareFailed extends CreateWareState {
  final String message;
  const CreateWareFailed(this.message);

  @override
  List<Object> get props => [];
}