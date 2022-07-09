part of 'create_stock_bloc.dart';

abstract class CreateStockEvent extends Equatable {
  const CreateStockEvent();
}

class CreateStock extends CreateStockEvent {
  final CreateStockEntity createEntity;
  const CreateStock(this.createEntity);

  @override
  List<Object> get props => [];
}