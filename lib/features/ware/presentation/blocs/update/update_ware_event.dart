part of 'update_ware_bloc.dart';

abstract class UpdateWareEvent extends Equatable {
  const UpdateWareEvent();
}

class UpdateWare extends UpdateWareEvent {
  final UpdateWareEntity updateEntity;
  const UpdateWare(this.updateEntity);

  @override
  List<Object> get props => [];
}