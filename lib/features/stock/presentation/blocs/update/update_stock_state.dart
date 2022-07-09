part of 'update_stock_bloc.dart';

abstract class UpdateStockState extends Equatable {
  const UpdateStockState();
}

class UpdateStockInitial extends UpdateStockState {
  @override
  List<Object> get props => [];
}

class UpdateStockInProgress extends UpdateStockState {
  @override
  List<Object> get props => [];
}

class UpdateStockSuccess extends UpdateStockState {
  @override
  List<Object> get props => [];
}

class UpdateStockFailed extends UpdateStockState {
  final String message;
  const UpdateStockFailed(this.message);

  @override
  List<Object> get props => [];
}
