import 'package:demo_app/features/login/data/data_sources/i_login_remote_data_source.dart';
import 'package:demo_app/features/login/data/models/login_model.dart';
import 'package:demo_app/features/login/domain/entities/login.dart';
import 'package:demo_app/features/login/domain/repositories/i_login_repository.dart';

import '../data_sources/i_login_local_data_source.dart';

class LoginRepository implements ILoginRepository{
  final ILoginRemoteDataSource _remoteDataSource;
  final ILoginLocalDataSource _localDataSource;

  LoginRepository(this._remoteDataSource, this._localDataSource);

  @override
  Future<String> login(Login login) {
    return _remoteDataSource.login(LoginModel.fromEntity(login));
  }

  @override
  Future<void> saveToken(String token) {
    return _localDataSource.saveToken(token);
  }

  @override
  Future<String> getToken() {
    return _localDataSource.getToken();
  }
}