part of 'delete_product_bloc.dart';

abstract class DeleteProductEvent extends Equatable {
  const DeleteProductEvent();
}

class DeleteProduct extends DeleteProductEvent {
  final String id;

  const DeleteProduct(this.id);

  @override
  List<Object> get props => [];
}
