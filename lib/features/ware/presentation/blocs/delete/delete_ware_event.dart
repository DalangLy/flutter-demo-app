part of 'delete_ware_bloc.dart';

abstract class DeleteWareEvent extends Equatable {
  const DeleteWareEvent();
}

class DeleteWare extends DeleteWareEvent {
  final String id;

  const DeleteWare(this.id);

  @override
  List<Object> get props => [];
}