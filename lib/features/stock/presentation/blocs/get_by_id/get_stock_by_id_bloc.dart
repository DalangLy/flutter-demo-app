import 'package:bloc/bloc.dart';
import 'package:demo_app/features/stock/domain/entities/stock_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/get_stock_by_id_use_case.dart';

part 'get_stock_by_id_event.dart';
part 'get_stock_by_id_state.dart';

class GetStockByIdBloc extends Bloc<GetStockByIdEvent, GetStockByIdState> {
  final GetStockByIdUseCase _getStockByIdUseCase;
  GetStockByIdBloc(this._getStockByIdUseCase) : super(GetStockByIdInitial()) {
    on<GetStockByIdEvent>((event, emit) async{
      if(event is GetStockById){
        try{
          emit(GetStockByIdInProgress());
          final result = await _getStockByIdUseCase(event.id);
          emit(GetStockByIdSuccess(result));
        }catch(e){
          emit(const GetStockByIdFailed('ggg'));
        }
      }
    });
  }

  void getById(String id){
    add(GetStockById(id));
  }
}
