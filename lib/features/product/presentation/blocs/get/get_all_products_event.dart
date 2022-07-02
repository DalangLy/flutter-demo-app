part of 'get_all_products_bloc.dart';

abstract class GetAllProductsEvent extends Equatable {
  const GetAllProductsEvent();
}

class GetAllProducts extends GetAllProductsEvent {
  @override
  List<Object> get props => [];
}