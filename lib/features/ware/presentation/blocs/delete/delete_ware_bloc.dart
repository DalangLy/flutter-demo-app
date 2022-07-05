import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_ware_event.dart';
part 'delete_ware_state.dart';

class DeleteWareBloc extends Bloc<DeleteWareEvent, DeleteWareState> {
  DeleteWareBloc() : super(DeleteWareInitial()) {
    on<DeleteWareEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void delete(String id){

  }
}
