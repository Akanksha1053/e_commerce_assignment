part of 'cart_items_bloc.dart';

abstract class CartItemsState extends Equatable {
  const CartItemsState();

  @override
  List<Object> get props => [];
}

class CartItemsInitial extends CartItemsState {}

class CartItemsLoading extends CartItemsState {}

class CartItemsLoadedState extends CartItemsState {
  static num totalPrice = 0;
  final List<PlantEntity> cartListItems;
  const CartItemsLoadedState({required this.cartListItems});
  @override
  List<Object> get props => [cartListItems];
}

class ErrorState extends CartItemsState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
