import '../entities/ware.dart';

abstract class IWareRepository{
  Future<List<Ware>> getAll();
  Future<Ware> getById(String id);
  Future<void> delete(String id);
  Future<void> create(Ware ware);
  Future<void> update(Ware ware);
}