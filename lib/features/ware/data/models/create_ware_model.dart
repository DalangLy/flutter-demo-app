import '../../domain/entities/create_ware_entity.dart';

class CreateWareModel extends CreateWareEntity{
  CreateWareModel(super.code, super.name, super.description);


  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'description': description,
      'code': code
    };
  }

  factory CreateWareModel.fromEntity(CreateWareEntity entity){
    return CreateWareModel(entity.code, entity.name, entity.description);
  }
}