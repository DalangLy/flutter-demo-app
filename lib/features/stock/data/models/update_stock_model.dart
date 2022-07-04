import 'package:demo_app/features/stock/domain/entities/update_stock_entity.dart';

class UpdateStockModel extends UpdateStockEntity{
  UpdateStockModel(super.id, super.quantity);

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'quantity': quantity,
    };
  }

  factory UpdateStockModel.fromEntity(UpdateStockEntity entity){
    return UpdateStockModel(entity.id, entity.quantity);
  }
}