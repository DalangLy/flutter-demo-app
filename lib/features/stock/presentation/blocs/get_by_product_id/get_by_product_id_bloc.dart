import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/stock_entity.dart';
import '../../../domain/use_cases/get_stock_by_product_id_use_case.dart';

part 'get_by_product_id_event.dart';
part 'get_by_product_id_state.dart';

class GetByProductIdBloc extends Bloc<GetByProductIdEvent, GetByProductIdState> {
  final GetStockByProductIdUseCase _getStockByProductIdUseCase;
  GetByProductIdBloc(this._getStockByProductIdUseCase) : super(GetByProductIdInitial()) {
    on<GetByProductIdEvent>((event, emit) async{
      if(event is GetStockByProductId){
        try{
          emit(GetStockByProductIdInProgress());
          final result = await _getStockByProductIdUseCase(event.id);
          emit(GetStockByProductIdSuccess(result));
        }catch(e){
          emit(const GetStockByProductIdFailed('ggg'));
        }
      }
    });
  }

  void getByProductId(String id){
    add(GetStockByProductId(id));
  }
}
