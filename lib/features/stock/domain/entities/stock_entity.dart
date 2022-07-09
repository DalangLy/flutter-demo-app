import '../../../product/domain/entities/product_entity.dart';
import '../../../ware/domain/entities/ware_entity.dart';

class StockEntity{
  final String id;
  final ProductEntity product;
  final WareEntity ware;
  final String productId;
  final String wareId;
  final int quantity;
  final DateTime documentDate;
  final DateTime postingDate;

  StockEntity(this.id, this.product, this.ware, this.productId, this.wareId, this.quantity, this.documentDate, this.postingDate);
}