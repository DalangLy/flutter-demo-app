import 'package:demo_app/features/login/domain/entities/login.dart';
import '../repositories/i_login_repository.dart';

class LoginUseCase{
  final ILoginRepository _repository;
  const LoginUseCase(this._repository);
  Future<void> call(Login login) async{
    String token = await _repository.login(login);
    return _repository.saveToken(token);
  }
}