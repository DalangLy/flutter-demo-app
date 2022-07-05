import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../repositories/i_ware_repository.dart';

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