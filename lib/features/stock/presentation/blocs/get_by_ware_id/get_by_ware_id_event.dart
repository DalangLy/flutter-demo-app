part of 'get_by_ware_id_bloc.dart';

abstract class GetByWareIdEvent extends Equatable {
  const GetByWareIdEvent();
}

class GetStockByWareId extends GetByWareIdEvent {
  final String id;
  const GetStockByWareId(this.id);

  @override
  List<Object> get props => [];
}