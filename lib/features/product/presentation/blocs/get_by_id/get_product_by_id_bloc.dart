import 'package:bloc/bloc.dart';
import 'package:demo_app/features/product/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/get_product_by_id_use_case.dart';

part 'get_product_by_id_event.dart';
part 'get_product_by_id_state.dart';

class GetProductByIdBloc extends Bloc<GetProductByIdEvent, GetProductByIdState> {
  final GetProductByIdUseCase _getProductByIdUsCase;
  GetProductByIdBloc(this._getProductByIdUsCase) : super(GetProductByIdInitial()) {
    on<GetProductByIdEvent>((event, emit) async{
      if(event is GetProductById){
        try{
          emit(GetProductByIdInProgress());
          final result = await _getProductByIdUsCase(event.id);
          emit(GetProductByIdSuccess(result));
        }catch(e){
          emit(const GetProductByIdFailed('ggg'));
        }
      }
    });
  }

  void getById(String id){
    add(GetProductById(id));
  }
}
