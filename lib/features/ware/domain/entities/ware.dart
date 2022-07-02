import '../../../stock/domain/entities/stock.dart';

class Ware{
  final String id;
  final String code;
  final List<Stock> stockings;
  final String name;
  final String? description;

  Ware(this.id, this.code, this.stockings, this.name, this.description);
}