import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app/features/ware/domain/entities/create_ware_entity.dart';
import 'package:equatable/equatable.dart';

part 'create_ware_event.dart';
part 'create_ware_state.dart';

class CreateWareBloc extends Bloc<CreateWareEvent, CreateWareState> {
  CreateWareBloc() : super(CreateWareInitial()) {
    on<CreateWareEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void create(CreateWareEntity entity){

  }
}
