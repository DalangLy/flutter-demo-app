part of 'get_all_stocks_bloc.dart';

abstract class GetAllStocksState extends Equatable {
  const GetAllStocksState();
}

class GetAllStocksInitial extends GetAllStocksState {
  @override
  List<Object> get props => [];
}

class GetAllStocksInProgress extends GetAllStocksState {
  @override
  List<Object> get props => [];
}

class GetAllStocksSuccess extends GetAllStocksState {
  final List<StockEntity> data;
  const GetAllStocksSuccess(this.data);

  @override
  List<Object> get props => [];
}

class GetAllStocksFailed extends GetAllStocksState {
  final String message;
  const GetAllStocksFailed(this.message);

  @override
  List<Object> get props => [];
}