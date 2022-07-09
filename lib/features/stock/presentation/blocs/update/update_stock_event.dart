part of 'update_stock_bloc.dart';

abstract class UpdateStockEvent extends Equatable {
  const UpdateStockEvent();
}

class UpdateStock extends UpdateStockEvent {
  final UpdateStockEntity updateEntity;
  const UpdateStock(this.updateEntity);

  @override
  List<Object> get props => [];
}