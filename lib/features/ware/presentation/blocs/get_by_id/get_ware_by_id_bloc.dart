import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/ware_entity.dart';
import '../../../domain/use_cases/get_ware_by_id_use_case.dart';

part 'get_ware_by_id_event.dart';
part 'get_ware_by_id_state.dart';

class GetWareByIdBloc extends Bloc<GetWareByIdEvent, GetWareByIdState> {
  final GetWareByIdUseCase _getWareByIdUseCase;
  GetWareByIdBloc(this._getWareByIdUseCase) : super(GetWareByIdInitial()) {
    on<GetWareByIdEvent>((event, emit) async{
      if(event is GetWareById){
        try{
          emit(GetWareByIdInProgress());
          final result = await _getWareByIdUseCase(event.id);
          emit(GetWareByIdSuccess(result));
        }catch(e){
          emit(const GetWareByIdFailed('ggg'));
        }
      }
    });
  }

  void getById(String id){
    add(GetWareById(id));
  }
}
