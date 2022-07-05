import 'package:demo_app/features/ware/domain/repositories/i_ware_repository.dart';

import '../../../../core/errors/UnauthenticatedFailure.dart';
import '../../../login/domain/repositories/i_login_repository.dart';
import '../entities/update_ware_entity.dart';

class UpdateWareUseCase{
  final IWareRepository _repository;
  final ILoginRepository _loginRepository;

  UpdateWareUseCase(this._repository, this._loginRepository);

  Future<void> call(UpdateWareEntity product) async{
    String? token = await _hasToken();
    if(token == null) throw UnauthenticatedFailed('Unauthenticated');
    final updatedId = _repository.update(product, token);
    return null;
  }

  Future<String?> _hasToken() async{
    String? token = await _loginRepository.getToken();
    return token;
  }
}