part of 'get_all_wares_bloc.dart';

abstract class GetAllWaresState extends Equatable {
  const GetAllWaresState();
}

class GetAllWaresInitial extends GetAllWaresState {
  @override
  List<Object> get props => [];
}

class GetAllWaresInProgress extends GetAllWaresState {
  @override
  List<Object> get props => [];
}

class GetAllWaresSuccess extends GetAllWaresState {
  final List<Ware> data;
  const GetAllWaresSuccess(this.data);

  @override
  List<Object> get props => [];
}

class GetAllWaresFailed extends GetAllWaresState {
  final String message;
  const GetAllWaresFailed(this.message);

  @override
  List<Object> get props => [];
}