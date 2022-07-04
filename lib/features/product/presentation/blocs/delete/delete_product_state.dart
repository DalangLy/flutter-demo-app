part of 'delete_product_bloc.dart';

abstract class DeleteProductState extends Equatable {
  const DeleteProductState();
}

class DeleteProductInitial extends DeleteProductState {
  @override
  List<Object> get props => [];
}

class DeleteProductInProgress extends DeleteProductState {
  @override
  List<Object> get props => [];
}

class DeleteProductSuccess extends DeleteProductState {
  @override
  List<Object> get props => [];
}

class DeleteProductFailed extends DeleteProductState {
  final String message;

  const DeleteProductFailed(this.message);

  @override
  List<Object> get props => [];
}
