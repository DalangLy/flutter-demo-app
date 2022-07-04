import 'package:demo_app/features/stock/domain/entities/stock_entity.dart';

import '../../../stock/data/models/stock_model.dart';
import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity{
  ProductModel(super.id, super.code, super.stockings, super.name, super.price, super.description);

  factory ProductModel.fromJson(Map<String, dynamic> json){

    final dynamic itemSizeApplyingJson = json['stockings'];
    final List<StockEntity> itemSizeApplyingModel =
    itemSizeApplyingJson == null
        ? []
        : List<StockEntity>.from(itemSizeApplyingJson
        .map<StockEntity>((itemSizeApplyingJson) =>
        StockModel.fromJson(itemSizeApplyingJson)));

    return ProductModel(
      json['id'],
      json['code'],
      itemSizeApplyingModel,
      json['name'],
      (json['price'] as num).toDouble(),
      json['description'],
    );
  }
}