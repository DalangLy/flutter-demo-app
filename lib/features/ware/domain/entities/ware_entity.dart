import '../../../stock/domain/entities/stock_entity.dart';

class WareEntity{
  final String id;
  final String code;
  final List<StockEntity> stockings;
  final String name;
  final String? description;

  WareEntity(this.id, this.code, this.stockings, this.name, this.description);
}