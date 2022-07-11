import '../models/create_user_model.dart';

abstract class IUserRemoteDataSource{
  Future<String> create(CreateUserModel model, String accessToken);
}