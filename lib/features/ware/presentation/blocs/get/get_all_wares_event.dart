part of 'get_all_wares_bloc.dart';

abstract class GetAllWaresEvent extends Equatable {
  const GetAllWaresEvent();
}

class GetAllWares extends GetAllWaresEvent {
  @override
  List<Object> get props => [];
}