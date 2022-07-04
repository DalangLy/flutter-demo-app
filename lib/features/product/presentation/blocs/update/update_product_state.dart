part of 'update_product_bloc.dart';

abstract class UpdateProductState extends Equatable {
  const UpdateProductState();
}

class UpdateProductInitial extends UpdateProductState {
  @override
  List<Object> get props => [];
}

class UpdateProductInProgress extends UpdateProductState {
  @override
  List<Object> get props => [];
}

class UpdateProductSuccess extends UpdateProductState {
  @override
  List<Object> get props => [];
}

class UpdateProductFailed extends UpdateProductState {
  final String message;
  const UpdateProductFailed(this.message);

  @override
  List<Object> get props => [];
}
