import 'package:demo_app/features/login/data/data_sources/i_login_data_source.dart';
import 'package:demo_app/features/login/data/models/login_model.dart';
import 'package:demo_app/features/login/domain/entities/login.dart';
import 'package:demo_app/features/login/domain/repositories/i_login_repository.dart';

class LoginRepository implements ILoginRepository{
  final ILoginDataSource _dataSource;

  LoginRepository(this._dataSource);

  @override
  Future<void> login(Login login) {
    return _dataSource.login(LoginModel.fromEntity(login));
  }
}