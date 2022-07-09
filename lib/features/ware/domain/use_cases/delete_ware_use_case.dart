import 'package:demo_app/features/ware/domain/repositories/i_ware_repository.dart';

import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';

class DeleteWareUseCase{
  final IWareRepository _repository;
  final ILoginRepository _loginRepository;

  DeleteWareUseCase(this._repository, this._loginRepository,);

  Future<void> call(String id) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    String insertedId = await _repository.delete(id, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}