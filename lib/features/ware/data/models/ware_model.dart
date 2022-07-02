import '../../../stock/data/models/stock_model.dart';
import '../../../stock/domain/entities/stock.dart';
import '../../domain/entities/ware.dart';

class WareModel extends Ware {
  WareModel(
      super.id, super.code, super.stockings, super.name, super.description);

  factory WareModel.fromJson(Map<String, dynamic> json) {
    final dynamic itemSizeApplyingJson = json['stockings'];
    final List<Stock> itemSizeApplyingModel = itemSizeApplyingJson == null
        ? []
        : List<Stock>.from(itemSizeApplyingJson.map<Stock>(
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
