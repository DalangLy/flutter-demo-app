part of 'create_for_product_bloc.dart';

abstract class CreateForProductEvent extends Equatable {
  const CreateForProductEvent();
}

class CreateForProduct extends CreateForProductEvent {
  final CreateForProductEntity createEntity;
  const CreateForProduct(this.createEntity);

  @override
  List<Object> get props => [];
}