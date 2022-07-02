import '../../../stock/data/models/stock_model.dart';
import '../../../stock/domain/entities/stock.dart';
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(super.id, super.code, super.stockings, super.name, super.price,
      super.description);

  factory ProductModel.fromJson(Map<String, dynamic> json) {

    final dynamic itemSizeApplyingJson = json['stockings'];
    final List<Stock> itemSizeApplyingModel =
    itemSizeApplyingJson == null
        ? []
        : List<Stock>.from(itemSizeApplyingJson
        .map<Stock>((itemSizeApplyingJson) =>
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
