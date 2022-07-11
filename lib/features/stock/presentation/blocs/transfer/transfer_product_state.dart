part of 'transfer_product_bloc.dart';

abstract class TransferProductState extends Equatable {
  const TransferProductState();
}

class TransferProductInitial extends TransferProductState {
  @override
  List<Object> get props => [];
}

class TransferProductInProgress extends TransferProductState {
  @override
  List<Object> get props => [];
}

class TransferProductSuccess extends TransferProductState {
  @override
  List<Object> get props => [];
}

class TransferProductFailed extends TransferProductState {
  final String message;

  const TransferProductFailed(this.message);

  @override
  List<Object> get props => [];
}