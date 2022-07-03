import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity{
  ProductModel(super.id, super.code, super.stockings, super.name, super.price, super.description);

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(json['id'], json['code'], json['stockings'], json['name'], (json['price'] as num).toDouble(), json['description'],);
  }


  //
  // Map<String, dynamic> toJson(){
  //   return {
  //     'code': code,
  //     'name': name,
  //     'price': price,
  //     'description': description,
  //   };
  // }
  //
  // factory ProductModel.fromEntity(ProductEntity product){
  //   return ProductModel(
  //     code: product.code,
  //     name: product.name,
  //     price: product.price,
  //     description: product.description,
  //   );
  // }
}