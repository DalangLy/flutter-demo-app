import '../../domain/entities/update_ware_entity.dart';

class UpdateWareModel extends UpdateWareEntity{
  UpdateWareModel(super.id, super.name, super.description);

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'description': description,
      'id': id
    };
  }

  factory UpdateWareModel.fromEntity(UpdateWareEntity entity){
    return UpdateWareModel(entity.id, entity.name, entity.description);
  }
}