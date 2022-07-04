part of 'delete_stock_bloc.dart';

abstract class DeleteStockState extends Equatable {
  const DeleteStockState();
}

class DeleteStockInitial extends DeleteStockState {
  @override
  List<Object> get props => [];
}

class DeleteStockInProgress extends DeleteStockState {
  @override
  List<Object> get props => [];
}

class DeleteStockSuccess extends DeleteStockState {
  @override
  List<Object> get props => [];
}

class DeleteStockFailed extends DeleteStockState {
  final String message;

  const DeleteStockFailed(this.message);

  @override
  List<Object> get props => [];
}