import 'package:demo_app/features/stock/domain/entities/create_stock_entity.dart';

class CreateStockModel extends CreateStockEntity{
  CreateStockModel(super.productCode, super.wareCode, super.quantity);

  Map<String, dynamic> toJson(){
    return {
      'productCode': productCode,
      'wareCode': wareCode,
      'quantity': quantity,
    };
  }

  factory CreateStockModel.fromEntity(CreateStockEntity entity){
    return CreateStockModel(entity.productCode, entity.wareCode, entity.quantity);
  }
}