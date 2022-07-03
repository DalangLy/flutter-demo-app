part of 'create_product_bloc.dart';

abstract class CreateProductState extends Equatable {
  const CreateProductState();
}

class CreateProductInitial extends CreateProductState {
  @override
  List<Object> get props => [];
}

class CreateProductInProgress extends CreateProductState {
  @override
  List<Object> get props => [];
}

class CreateProductSuccess extends CreateProductState {
  @override
  List<Object> get props => [];
}

class CreateProductFailed extends CreateProductState {
  final String message;
  const CreateProductFailed(this.message);

  @override
  List<Object> get props => [];
}
