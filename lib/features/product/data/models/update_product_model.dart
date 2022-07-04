import '../../domain/entities/update_product_entity.dart';

class UpdateProductModel extends UpdateProductEntity{
  UpdateProductModel(super.id, super.name, super.price, super.description);

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'price': price,
      'description': description,
      'id': id
    };
  }

  factory UpdateProductModel.fromEntity(UpdateProductEntity entity){
    return UpdateProductModel(entity.id, entity.name, entity.price, entity.description);
  }
}