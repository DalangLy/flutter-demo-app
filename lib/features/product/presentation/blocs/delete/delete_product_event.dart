part of 'delete_product_bloc.dart';

abstract class DeleteProductEvent extends Equatable {
  const DeleteProductEvent();
}

class DeleteProduct extends DeleteProductEvent {
  const DeleteProduct();

  @override
  List<Object> get props => [];
}
