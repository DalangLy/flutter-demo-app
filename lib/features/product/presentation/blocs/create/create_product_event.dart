part of 'create_product_bloc.dart';

abstract class CreateProductEvent extends Equatable {
  const CreateProductEvent();
}

class CreateProduct extends CreateProductEvent {
  final CreateProductEntity createProduct;
  const CreateProduct(this.createProduct);

  @override
  List<Object> get props => [];
}