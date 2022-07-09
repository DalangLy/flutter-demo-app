part of 'delete_ware_bloc.dart';

abstract class DeleteWareState extends Equatable {
  const DeleteWareState();
}

class DeleteWareInitial extends DeleteWareState {
  @override
  List<Object> get props => [];
}

class DeleteWareInProgress extends DeleteWareState {
  @override
  List<Object> get props => [];
}

class DeleteWareSuccess extends DeleteWareState {
  @override
  List<Object> get props => [];
}

class DeleteWareFailed extends DeleteWareState {
  final String message;

  const DeleteWareFailed(this.message);

  @override
  List<Object> get props => [];
}
