import 'package:demo_app/features/ware/domain/entities/create_ware_entity.dart';
import 'package:demo_app/features/ware/domain/repositories/i_ware_repository.dart';

import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';

class CreateWareUseCase{
  final IWareRepository _repository;
  final ILoginRepository _loginRepository;

  CreateWareUseCase(this._repository, this._loginRepository);

  Future<void> call(CreateWareEntity entity) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    final insertedId = _repository.create(entity, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}