import '../../../stock/domain/entities/stock.dart';

class Product{
  final String id;
  final String code;
  final List<Stock> stockings;
  final String name;
  final double price;
  final String? description;

  Product(this.id, this.code, this.stockings, this.name, this.price, this.description);
}