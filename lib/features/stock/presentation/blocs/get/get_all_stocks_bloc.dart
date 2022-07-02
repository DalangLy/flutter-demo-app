import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/stock.dart';
import '../../../domain/use_cases/get_all_stocks_use_case.dart';

part 'get_all_stocks_event.dart';
part 'get_all_stocks_state.dart';

class GetAllStocksBloc extends Bloc<GetAllStocksEvent, GetAllStocksState> {
  final GetAllStocksUseCase _getAllStocksUseCase;
  GetAllStocksBloc(this._getAllStocksUseCase) : super(GetAllStocksInitial()) {
    on<GetAllStocksEvent>((event, emit) async{
      if(event is GetAllStocks){
        emit(GetAllStocksInProgress());
        try{
          final List<Stock> data = await _getAllStocksUseCase();
          print('Get Success');
          emit(GetAllStocksSuccess(data));
        }catch(e){
          emit(const GetAllStocksFailed("Failed to get all stocks"));
        }
      }
    });
  }

  void getAllStocks(){
    add(GetAllStocks());
  }
}
