import '../../../product/domain/entities/product.dart';
import '../../../ware/domain/entities/ware.dart';

class Stock{
  final String id;
  final Product product;
  final Ware ware;
  final String productId;
  final String wareId;
  final int quantity;
  final DateTime documentDate;
  final DateTime postingDate;

  Stock(this.id, this.product, this.ware, this.productId, this.wareId, this.quantity, this.documentDate, this.postingDate);
}