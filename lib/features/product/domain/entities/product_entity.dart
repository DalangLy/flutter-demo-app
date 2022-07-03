import '../../../stock/domain/entities/stock_entity.dart';

class ProductEntity{
  final String id;
  final String code;
  final List<StockEntity> stockings;
  final String name;
  final double price;
  final String? description;

  ProductEntity(this.id, this.code, this.stockings, this.name, this.price, this.description);
}