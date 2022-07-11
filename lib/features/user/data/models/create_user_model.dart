import 'dart:convert';
import 'package:demo_app/features/user/domain/entities/create_user_entity.dart';

class CreateUserModel extends CreateUserEntity{
  CreateUserModel(super.name, super.password, super.roles);

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'password': password,
      'roles': roles.map((e) => json.encode(e)),
    };
  }

  factory CreateUserModel.fromEntity(CreateUserEntity entity){
    return CreateUserModel(entity.name, entity.password, entity.roles);
  }
}