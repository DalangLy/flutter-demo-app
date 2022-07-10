import 'package:demo_app/features/ware/domain/entities/update_ware_entity.dart';
import 'package:demo_app/features/ware/domain/repositories/i_ware_repository.dart';
import '../../../../core/errors/unauthenticated_failure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';

class UpdateWareUseCase{
  final IWareRepository _repository;
  final ILoginRepository _loginRepository;

  UpdateWareUseCase(this._repository, this._loginRepository);

  Future<void> call(UpdateWareEntity entity) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailure('Unauthenticated');
    final updatedId = _repository.update(entity, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}