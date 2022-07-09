import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/stock_entity.dart';
import '../../../domain/use_cases/get_stock_by_ware_id_use_case.dart';

part 'get_by_ware_id_event.dart';
part 'get_by_ware_id_state.dart';

class GetByWareIdBloc extends Bloc<GetByWareIdEvent, GetByWareIdState> {
  final GetStockByWareIdUseCase _getStockByWareIdUseCase;
  GetByWareIdBloc(this._getStockByWareIdUseCase) : super(GetByWareIdInitial()) {
    on<GetByWareIdEvent>((event, emit) async{
      if(event is GetStockByWareId){
        try{
          emit(GetStockByWareIdInProgress());
          final result = await _getStockByWareIdUseCase(event.id);
          emit(GetStockByWareIdSuccess(result));
        }catch(e){
          emit(const GetStockByWareIdFailed('ggg'));
        }
      }
    });
  }

  void getByWareId(String id){
    add(GetStockByWareId(id));
  }
}
