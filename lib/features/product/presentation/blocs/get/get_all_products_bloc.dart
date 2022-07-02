import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/use_cases/get_all_products_use_case.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  final GetAllProductsUseCase _getAllProductsUseCase;
  GetAllProductsBloc(this._getAllProductsUseCase) : super(GetAllProductsInitial()) {
    on<GetAllProductsEvent>((event, emit) async{
      if(event is GetAllProducts){
        emit(GetAllProductsInProgress());
        try{
          final List<Product> data = await _getAllProductsUseCase();
          print('Get Success');
          emit(GetAllProductsSuccess(data));
        }catch(e){
          emit(const GetAllProductsFailed("Failed to get all products"));
        }
      }
    });
  }

  void getAllProducts(){
    add(GetAllProducts());
  }
}
