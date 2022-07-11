import 'package:demo_app/features/user/domain/entities/create_user_entity.dart';

abstract class IUserRepository{
  Future<String> create(CreateUserEntity entity, String accessToken);
}