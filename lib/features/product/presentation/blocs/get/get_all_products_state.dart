part of 'get_all_products_bloc.dart';

abstract class GetAllProductsState extends Equatable {
  const GetAllProductsState();
}

class GetAllProductsInitial extends GetAllProductsState {
  @override
  List<Object> get props => [];
}

class GetAllProductsInProgress extends GetAllProductsState {
  @override
  List<Object> get props => [];
}

class GetAllProductsSuccess extends GetAllProductsState {
  final List<Product> data;
  const GetAllProductsSuccess(this.data);

  @override
  List<Object> get props => [];
}

class GetAllProductsFailed extends GetAllProductsState {
  final String message;
  const GetAllProductsFailed(this.message);

  @override
  List<Object> get props => [];
}
