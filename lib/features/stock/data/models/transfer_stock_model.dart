import 'package:demo_app/features/stock/domain/entities/transfer_stock_entity.dart';

class TransferStockModel extends TransferStockEntity{
  TransferStockModel(super.productId, super.quantity, super.sourceWareId, super.targetWareId);

  Map<String, dynamic> toJson(){
    return {
      'productId': productId,
      'quantity': quantity,
      'sourceWareId': sourceWareId,
      'targetWareId': targetWareId,
    };
  }

  factory TransferStockModel.fromEntity(TransferStockEntity entity){
    return TransferStockModel(entity.productId, entity.quantity, entity.sourceWareId, entity.targetWareId);
  }
}