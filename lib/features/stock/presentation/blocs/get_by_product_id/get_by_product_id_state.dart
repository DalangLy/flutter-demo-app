part of 'get_by_product_id_bloc.dart';

abstract class GetByProductIdState extends Equatable {
  const GetByProductIdState();
}

class GetByProductIdInitial extends GetByProductIdState {
  @override
  List<Object> get props => [];
}

class GetStockByProductIdInProgress extends GetByProductIdState {
  @override
  List<Object> get props => [];
}

class GetStockByProductIdSuccess extends GetByProductIdState {
  final StockEntity entity;

  const GetStockByProductIdSuccess(this.entity);

  @override
  List<Object> get props => [];
}

class GetStockByProductIdFailed extends GetByProductIdState {
  final String message;

  const GetStockByProductIdFailed(this.message);

  @override
  List<Object> get props => [];
}