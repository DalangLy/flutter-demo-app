import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/create_product_entity.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc() : super(CreateProductInitial()) {
    on<CreateProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
