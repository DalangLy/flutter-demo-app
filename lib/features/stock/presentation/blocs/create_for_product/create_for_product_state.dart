part of 'create_for_product_bloc.dart';

abstract class CreateForProductState extends Equatable {
  const CreateForProductState();
}

class CreateForProductInitial extends CreateForProductState {
  @override
  List<Object> get props => [];
}

class CreateForProductInProgress extends CreateForProductState {
  @override
  List<Object> get props => [];
}

class CreateForProductSuccess extends CreateForProductState {
  @override
  List<Object> get props => [];
}

class CreateForProductFailed extends CreateForProductState {
  final String message;
  const CreateForProductFailed(this.message);

  @override
  List<Object> get props => [];
}