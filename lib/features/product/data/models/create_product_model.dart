import 'package:demo_app/features/product/domain/entities/create_product_entity.dart';

class CreateProductModel extends CreateProductEntity{
  CreateProductModel(super.code, super.name, super.price, super.description);

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'price': price,
      'description': description,
      'code': code
    };
  }

  factory CreateProductModel.fromEntity(CreateProductEntity entity){
    return CreateProductModel(entity.code, entity.name, entity.price, entity.description);
  }
}