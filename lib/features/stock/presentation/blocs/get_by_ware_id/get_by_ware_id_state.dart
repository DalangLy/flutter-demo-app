part of 'get_by_ware_id_bloc.dart';

abstract class GetByWareIdState extends Equatable {
  const GetByWareIdState();
}

class GetByWareIdInitial extends GetByWareIdState {
  @override
  List<Object> get props => [];
}

class GetStockByWareIdInProgress extends GetByWareIdState {
  @override
  List<Object> get props => [];
}

class GetStockByWareIdSuccess extends GetByWareIdState {
  final StockEntity entity;

  const GetStockByWareIdSuccess(this.entity);

  @override
  List<Object> get props => [];
}

class GetStockByWareIdFailed extends GetByWareIdState {
  final String message;

  const GetStockByWareIdFailed(this.message);

  @override
  List<Object> get props => [];
}