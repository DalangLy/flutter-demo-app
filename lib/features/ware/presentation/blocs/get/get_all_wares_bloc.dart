import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/ware_entity.dart';
import '../../../domain/use_cases/get_all_wares_use_case.dart';

part 'get_all_wares_event.dart';
part 'get_all_wares_state.dart';

class GetAllWaresBloc extends Bloc<GetAllWaresEvent, GetAllWaresState> {
  final GetAllWaresUseCase _getAllWaresUseCase;
  GetAllWaresBloc(this._getAllWaresUseCase) : super(GetAllWaresInitial()) {
    on<GetAllWaresEvent>((event, emit) async{
      if(event is GetAllWares){
        emit(GetAllWaresInProgress());
        try{
          final List<WareEntity> data = await _getAllWaresUseCase();
          print('Get Success');
          emit(GetAllWaresSuccess(data));
        }catch(e){
          emit(const GetAllWaresFailed("Failed to get all stocks"));
        }
      }
    });
  }

  void getAllWares(){
    add(GetAllWares());
  }
}
