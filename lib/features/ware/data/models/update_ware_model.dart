import 'package:demo_app/features/ware/domain/entities/update_ware_entity.dart';

class UpdateWareModel extends UpdateWareEntity{
  UpdateWareModel(super.id, super.description, super.name);

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'description': description,
      'name': name
    };
  }

  factory UpdateWareModel.fromEntity(UpdateWareEntity entity){
    return UpdateWareModel(entity.id, entity.description, entity.name);
  }
}