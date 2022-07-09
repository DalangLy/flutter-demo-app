part of 'get_ware_by_id_bloc.dart';

abstract class GetWareByIdState extends Equatable {
  const GetWareByIdState();
}

class GetWareByIdInitial extends GetWareByIdState {
  @override
  List<Object> get props => [];
}

class GetWareByIdInProgress extends GetWareByIdState {
  @override
  List<Object> get props => [];
}

class GetWareByIdSuccess extends GetWareByIdState {
  final WareEntity entity;

  const GetWareByIdSuccess(this.entity);

  @override
  List<Object> get props => [];
}

class GetWareByIdFailed extends GetWareByIdState {
  final String message;

  const GetWareByIdFailed(this.message);

  @override
  List<Object> get props => [];
}