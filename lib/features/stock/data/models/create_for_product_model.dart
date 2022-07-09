import 'package:demo_app/features/stock/domain/entities/create_for_product_entity.dart';

class CreateForProductModel extends CreateForProductEntity{
  CreateForProductModel(super.productCode, super.productName, super.productPrice, super.productDescription, super.wareCode, super.quantity);

  Map<String, dynamic> toJson(){
    return {
      'productCode': productCode,
      'productName': wareCode,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'wareCode': wareCode,
      'quantity': quantity,
    };
  }

  factory CreateForProductModel.fromEntity(CreateForProductEntity entity){
    return CreateForProductModel(entity.productCode, entity.productName, entity.productPrice, entity.productDescription, entity.wareCode, entity.quantity);
  }
}