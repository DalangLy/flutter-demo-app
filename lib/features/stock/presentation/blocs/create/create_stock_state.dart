part of 'create_stock_bloc.dart';

abstract class CreateStockState extends Equatable {
  const CreateStockState();
}

class CreateStockInitial extends CreateStockState {
  @override
  List<Object> get props => [];
}

class CreateStockInProgress extends CreateStockState {
  @override
  List<Object> get props => [];
}

class CreateStockSuccess extends CreateStockState {
  @override
  List<Object> get props => [];
}

class CreateStockFailed extends CreateStockState {
  final String message;
  const CreateStockFailed(this.message);

  @override
  List<Object> get props => [];
}