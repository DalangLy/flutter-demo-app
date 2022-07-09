import 'package:demo_app/features/ware/domain/entities/create_ware_entity.dart';

class CreateWareModel extends CreateWareEntity{
  CreateWareModel(super.name, super.description, super.code);

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'description': description,
      'code': code
    };
  }

  factory CreateWareModel.fromEntity(CreateWareEntity entity){
    return CreateWareModel(entity.name, entity.description, entity.code);
  }
}