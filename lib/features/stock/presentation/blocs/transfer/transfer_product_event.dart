part of 'transfer_product_bloc.dart';

abstract class TransferProductEvent extends Equatable {
  const TransferProductEvent();
}

class TransferProduct extends TransferProductEvent {
  final TransferStockEntity _entity;

  const TransferProduct(this._entity);

  @override
  List<Object> get props => [];
}