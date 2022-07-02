part of 'get_all_stocks_bloc.dart';

abstract class GetAllStocksEvent extends Equatable {
  const GetAllStocksEvent();
}

class GetAllStocks extends GetAllStocksEvent {
  @override
  List<Object> get props => [];
}