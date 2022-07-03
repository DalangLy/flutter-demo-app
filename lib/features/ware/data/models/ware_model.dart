import '../../../stock/data/models/stock_model.dart';
import '../../../stock/domain/entities/stock_entity.dart';
import '../../domain/entities/ware.dart';

class WareModel extends Ware {
  WareModel(
      super.id, super.code, super.stockings, super.name, super.description);

  factory WareModel.fromJson(Map<String, dynamic> json) {
    final dynamic itemSizeApplyingJson = json['stockings'];
    final List<StockEntity> itemSizeApplyingModel = itemSizeApplyingJson == null
        ? []
        : List<StockEntity>.from(itemSizeApplyingJson.map<StockEntity>(
            (itemSizeApplyingJson) =>
                StockModel.fromJson(itemSizeApplyingJson)));
    return WareModel(
      json['id'],
      json['code'],
      itemSizeApplyingModel,
      json['name'],
      json['description'],
    );
  }
}
