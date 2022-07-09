part of 'get_by_product_code_bloc.dart';

abstract class GetByProductCodeState extends Equatable {
  const GetByProductCodeState();
}

class GetByProductCodeInitial extends GetByProductCodeState {
  @override
  List<Object> get props => [];
}

class GetStockByProductCodeInProgress extends GetByProductCodeState {
  @override
  List<Object> get props => [];
}

class GetStockByProductCodeSuccess extends GetByProductCodeState {
  final StockEntity entity;

  const GetStockByProductCodeSuccess(this.entity);

  @override
  List<Object> get props => [];
}

class GetStockByProductCodeFailed extends GetByProductCodeState {
  final String message;

  const GetStockByProductCodeFailed(this.message);

  @override
  List<Object> get props => [];
}