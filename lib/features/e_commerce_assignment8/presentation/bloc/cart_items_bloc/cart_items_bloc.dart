import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/get_cart_items.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/plant_entity.dart';
import '../../../domain/usecases/remove_from_cart.dart';

part 'cart_items_event.dart';
part 'cart_items_state.dart';

class CartItemsBloc extends Bloc<CartItemsEvent, CartItemsState> {
  final GetCartItemsListUseCase getCartItemsListUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  CartItemsBloc(this.getCartItemsListUseCase, this.removeFromCartUseCase)
      : super(CartItemsInitial()) {
    on<FetchCartItemEvent>((event, emit) async {
      final fetchedItemsFromCart =
          await getCartItemsListUseCase.call(GetCartItemsListNoParams());
      fetchedItemsFromCart.fold(
        (failure) => emit(ErrorState(message: failure.message)),
        (data) => emit(CartItemsLoadedState(cartListItems: data)),
      );
    });

    on<RemoveFromCartEvent>((event, emit) async {
      final removeItemFromCart = await removeFromCartUseCase
          .call(RemoveFromCartParam(itemToBeAdded: event.item));
      removeItemFromCart
          .fold((failure) => emit(ErrorState(message: failure.message)), (r) {
        add(FetchCartItemEvent());
      });
    });
  }
}
