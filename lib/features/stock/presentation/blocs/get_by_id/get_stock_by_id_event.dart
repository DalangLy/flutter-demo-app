part of 'get_stock_by_id_bloc.dart';

abstract class GetStockByIdEvent extends Equatable {
  const GetStockByIdEvent();
}

class GetStockById extends GetStockByIdEvent {
  final String id;
  const GetStockById(this.id);

  @override
  List<Object> get props => [];
}