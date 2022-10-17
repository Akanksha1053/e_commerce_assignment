import 'package:dartz/dartz.dart';
import 'package:e_commerce_assignment8/core/constants/constant_data.dart';
import 'package:e_commerce_assignment8/core/errors/failure.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/remove_from_cart.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/bloc/cart_items_bloc/cart_items_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/plant_entity.dart';
import '../../../domain/usecases/add_cart_item.dart';
import '../../../domain/usecases/fetch_items.dart';
import '../../../domain/usecases/get_cart_items.dart';

part 'all_items_event.dart';
part 'all_items_state.dart';

class AllItemsBloc extends Bloc<AllItemsEvent, AllItemsState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartItemsListUseCase getCartItemsListUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final FetchItemsListUseCase fetchAllItemsUseCase;

  AllItemsBloc(this.addToCartUseCase, this.getCartItemsListUseCase,
      this.removeFromCartUseCase, this.fetchAllItemsUseCase)
      : super(AllItemsInitial()) {
    on<AddToCartEvent>((event, emit) async {
      final addItemToCart = await addToCartUseCase
          .call(AddToCartParam(itemToBeAdded: event.item));
      await addItemToCart
          .fold((failure) async => emit(ErrorState(message: failure.message)),
              (r) async {
        emit(AllItemsLoadedState(allItems: r));
      });
    });
    on<RemoveFromCartEvent>((event, emit) async {
      final removeItemFromCart = await removeFromCartUseCase
          .call(RemoveFromCartParam(itemToBeAdded: event.item));
      removeItemFromCart
          .fold((failure) => emit(ErrorState(message: failure.message)), (r) {
        add(FetchAllItemsEvent());
      });
    });
    on<FetchAllItemsEvent>(((event, emit) async {
      final fetchedItems =
          await fetchAllItemsUseCase.call(FetchItemsListNoParams());
      fetchedItems.fold((failure) => emit(ErrorState(message: failure.message)),
          (data) => emit(AllItemsLoadedState(allItems: data)));
    }));

    on<OnTapEvent>((event, emit) async {
      bool isAdded = event.item.isAddedToCart;

      if (isAdded) {
        add(RemoveFromCartEvent(item: event.item));
        // add(FetchAllItemsEvent());
      } else {
        add(AddToCartEvent(item: event.item));
        // add(FetchAllItemsEvent());
      }
    });
  }
}
