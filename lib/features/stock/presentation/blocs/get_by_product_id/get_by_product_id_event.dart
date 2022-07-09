part of 'get_by_product_id_bloc.dart';

abstract class GetByProductIdEvent extends Equatable {
  const GetByProductIdEvent();
}

class GetStockByProductId extends GetByProductIdEvent {
  final String id;
  const GetStockByProductId(this.id);

  @override
  List<Object> get props => [];
}