part of 'get_product_by_id_bloc.dart';

abstract class GetProductByIdEvent extends Equatable {
  const GetProductByIdEvent();
}

class GetProductById extends GetProductByIdEvent {
  final String id;
  const GetProductById(this.id);

  @override
  List<Object> get props => [];
}