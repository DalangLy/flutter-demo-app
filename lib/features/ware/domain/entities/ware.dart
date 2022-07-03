import '../../../stock/domain/entities/stock_entity.dart';

class Ware{
  final String id;
  final String code;
  final List<StockEntity> stockings;
  final String name;
  final String? description;

  Ware(this.id, this.code, this.stockings, this.name, this.description);
}