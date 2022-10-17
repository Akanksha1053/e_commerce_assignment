part of 'cart_items_bloc.dart';

abstract class CartItemsEvent extends Equatable {
  const CartItemsEvent();

  @override
  List<Object> get props => [];
}

class FetchCartItemEvent extends CartItemsEvent {}

class RemoveFromCartEvent extends CartItemsEvent {
  final PlantEntity item;
  const RemoveFromCartEvent({required this.item});

  @override
  List<Object> get props => [item];
}
