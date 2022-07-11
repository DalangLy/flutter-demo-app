import 'package:demo_app/features/user/data/data_sources/i_user_remote_data_source.dart';
import 'package:demo_app/features/user/domain/entities/create_user_entity.dart';
import 'package:demo_app/features/user/domain/repositories/i_user_repository.dart';

import '../models/create_user_model.dart';

class UserRepository implements IUserRepository{
  final IUserRemoteDataSource _remoteDataSource;

  UserRepository(this._remoteDataSource);
  
  @override
  Future<String> create(CreateUserEntity entity, String accessToken) {
    return _remoteDataSource.create(CreateUserModel.fromEntity(entity), accessToken);
  }
}