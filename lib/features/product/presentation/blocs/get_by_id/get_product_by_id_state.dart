part of 'get_product_by_id_bloc.dart';

abstract class GetProductByIdState extends Equatable {
  const GetProductByIdState();
}

class GetProductByIdInitial extends GetProductByIdState {
  @override
  List<Object> get props => [];
}

class GetProductByIdInProgress extends GetProductByIdState {
  @override
  List<Object> get props => [];
}

class GetProductByIdSuccess extends GetProductByIdState {
  final ProductEntity product;

  const GetProductByIdSuccess(this.product);

  @override
  List<Object> get props => [];
}

class GetProductByIdFailed extends GetProductByIdState {
  final String message;

  const GetProductByIdFailed(this.message);

  @override
  List<Object> get props => [];
}