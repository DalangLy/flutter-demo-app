import 'package:demo_app/features/ware/domain/repositories/i_ware_repository.dart';

import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/ware_entity.dart';

class GetWareByIdUseCase{
  final IWareRepository _repository;
  final ILoginRepository _loginRepository;

  GetWareByIdUseCase(this._repository, this._loginRepository);

  Future<WareEntity> call(String id) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    return await _repository.getById(id, token);
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}