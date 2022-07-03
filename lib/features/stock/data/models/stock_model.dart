import '../../../product/data/models/product_model.dart';
import '../../../ware/data/models/ware_model.dart';
import '../../domain/entities/stock_entity.dart';

class StockModel extends StockEntity {
  StockModel(super.id, super.product, super.ware, super.productId, super.wareId,
      super.quantity, super.documentDate, super.postingDate);

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      json['id'],
      ProductModel.fromJson(json['product']),
      WareModel.fromJson(json['ware']),
      json['productId'],
      json['wareId'],
      (json['quantity'] as num).toInt(),
      DateTime.parse(
        json['documentDate'],
      ),
      DateTime.parse(
        json['postingDate'],
      ),
    );
  }
}
