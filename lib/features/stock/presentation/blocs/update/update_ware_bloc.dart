import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app/features/ware/domain/entities/update_ware_entity.dart';
import 'package:equatable/equatable.dart';

part 'update_ware_event.dart';
part 'update_ware_state.dart';

class UpdateWareBloc extends Bloc<UpdateWareEvent, UpdateWareState> {
  UpdateWareBloc() : super(UpdateWareInitial()) {
    on<UpdateWareEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void update(UpdateWareEntity entity){

  }
}
