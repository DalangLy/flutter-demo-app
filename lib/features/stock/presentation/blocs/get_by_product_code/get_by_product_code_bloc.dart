import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/stock_entity.dart';
import '../../../domain/use_cases/get_stock_by_product_code_use_case.dart';

part 'get_by_product_code_event.dart';
part 'get_by_product_code_state.dart';

class GetByProductCodeBloc extends Bloc<GetByProductCodeEvent, GetByProductCodeState> {
  final GetStockByProductCodeUseCase _getStockByProductCodeUseCase;
  GetByProductCodeBloc(this._getStockByProductCodeUseCase) : super(GetByProductCodeInitial()) {
    on<GetByProductCodeEvent>((event, emit) async{
      if(event is GetStockByProductCode){
        try{
          emit(GetStockByProductCodeInProgress());
          final result = await _getStockByProductCodeUseCase(event.id);
          emit(GetStockByProductCodeSuccess(result));
        }catch(e){
          emit(const GetStockByProductCodeFailed('ggg'));
        }
      }
    });
  }

  void getByProductCode(String code){
    add(GetStockByProductCode(code));
  }
}
