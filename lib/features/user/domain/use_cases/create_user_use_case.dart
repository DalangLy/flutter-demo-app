import 'package:demo_app/features/user/domain/entities/create_user_entity.dart';

import '../../../../core/errors/unauthenticated_failure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../repositories/i_user_repository.dart';

class CreateUserUseCase{
  final IUserRepository _repository;
  final ILoginRepository _loginRepository;

  CreateUserUseCase(this._repository, this._loginRepository);

  Future<void> call(CreateUserEntity entity) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailure('Unauthenticated');
    final insertedId = _repository.create(entity, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}