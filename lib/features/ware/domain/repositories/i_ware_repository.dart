import '../entities/ware.dart';

abstract class IWareRepository{
  Future<List<Ware>> getAll(String accessToken);
  Future<Ware> getById(String id, String accessToken);
  Future<void> delete(String id, String accessToken);
  Future<void> create(Ware ware, String accessToken);
  Future<void> update(Ware ware, String accessToken);
}