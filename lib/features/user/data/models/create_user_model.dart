import 'package:demo_app/features/user/domain/entities/create_user_entity.dart';

class CreateUserModel extends CreateUserEntity{
  CreateUserModel(super.name, super.password);

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'password': password
    };
  }

  factory CreateUserModel.fromEntity(CreateUserEntity entity){
    return CreateUserModel(entity.name, entity.password);
  }
}