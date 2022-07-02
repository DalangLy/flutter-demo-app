import '../entities/stock.dart';
import '../repositories/i_stock_repository.dart';

class GetAllStocksUseCase{
  final IStockRepository _repository;

  GetAllStocksUseCase(this._repository);

  Future<List<Stock>> call(){
    return _repository.getAll();
  }
}