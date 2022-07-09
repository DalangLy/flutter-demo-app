part of 'get_by_product_code_bloc.dart';

abstract class GetByProductCodeEvent extends Equatable {
  const GetByProductCodeEvent();
}

class GetStockByProductCode extends GetByProductCodeEvent {
  final String id;
  const GetStockByProductCode(this.id);

  @override
  List<Object> get props => [];
}