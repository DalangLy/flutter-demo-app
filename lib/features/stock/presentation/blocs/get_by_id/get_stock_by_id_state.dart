part of 'get_stock_by_id_bloc.dart';

abstract class GetStockByIdState extends Equatable {
  const GetStockByIdState();
}

class GetStockByIdInitial extends GetStockByIdState {
  @override
  List<Object> get props => [];
}

class GetStockByIdInProgress extends GetStockByIdState {
  @override
  List<Object> get props => [];
}

class GetStockByIdSuccess extends GetStockByIdState {
  final StockEntity entity;

  const GetStockByIdSuccess(this.entity);

  @override
  List<Object> get props => [];
}

class GetStockByIdFailed extends GetStockByIdState {
  final String message;

  const GetStockByIdFailed(this.message);

  @override
  List<Object> get props => [];
}