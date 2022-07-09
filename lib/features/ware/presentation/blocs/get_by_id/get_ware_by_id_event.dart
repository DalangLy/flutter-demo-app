part of 'get_ware_by_id_bloc.dart';

abstract class GetWareByIdEvent extends Equatable {
  const GetWareByIdEvent();
}

class GetWareById extends GetWareByIdEvent {
  final String id;
  const GetWareById(this.id);

  @override
  List<Object> get props => [];
}