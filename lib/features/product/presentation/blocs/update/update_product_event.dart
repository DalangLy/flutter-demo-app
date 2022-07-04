part of 'update_product_bloc.dart';

abstract class UpdateProductEvent extends Equatable {
  const UpdateProductEvent();
}

class UpdateProduct extends UpdateProductEvent {
  final UpdateProductEntity updateProduct;
  const UpdateProduct(this.updateProduct);

  @override
  List<Object> get props => [];
}