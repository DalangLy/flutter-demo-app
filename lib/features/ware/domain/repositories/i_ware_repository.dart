import 'package:demo_app/features/ware/domain/entities/create_ware_entity.dart';
import 'package:demo_app/features/ware/domain/entities/update_ware_entity.dart';

import '../entities/ware_entity.dart';

abstract class IWareRepository{
  Future<List<WareEntity>> getAll(String accessToken);
  Future<WareEntity> getById(String id, String accessToken);
  Future<String> delete(String id, String accessToken);
  Future<String> create(CreateWareEntity ware, String accessToken);
  Future<String> update(UpdateWareEntity ware, String accessToken);
}