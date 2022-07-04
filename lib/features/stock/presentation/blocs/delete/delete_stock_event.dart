part of 'delete_stock_bloc.dart';

abstract class DeleteStockEvent extends Equatable {
  const DeleteStockEvent();
}

class DeleteStock extends DeleteStockEvent {
  final String id;

  const DeleteStock(this.id);

  @override
  List<Object> get props => [];
}