part of 'create_ware_bloc.dart';

abstract class CreateWareEvent extends Equatable {
  const CreateWareEvent();
}

class CreateWare extends CreateWareEvent {
  final CreateWareEntity createEntity;
  const CreateWare(this.createEntity);

  @override
  List<Object> get props => [];
}