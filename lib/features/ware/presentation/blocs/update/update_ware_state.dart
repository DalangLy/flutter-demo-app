part of 'update_ware_bloc.dart';

abstract class UpdateWareState extends Equatable {
  const UpdateWareState();
}

class UpdateWareInitial extends UpdateWareState {
  @override
  List<Object> get props => [];
}

class UpdateWareInProgress extends UpdateWareState {
  @override
  List<Object> get props => [];
}

class UpdateWareSuccess extends UpdateWareState {
  @override
  List<Object> get props => [];
}

class UpdateWareFailed extends UpdateWareState {
  final String message;
  const UpdateWareFailed(this.message);

  @override
  List<Object> get props => [];
}
