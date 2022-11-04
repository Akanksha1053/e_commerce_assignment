import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/datasources/cart_items_remote_source.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/repositories/cart_items_repository.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/repositories/cart_items_repository.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/add_cart_item.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/fetch_items.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/get_cart_items.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/remove_from_cart.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/bloc/all_items_bloc/all_items_bloc.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc_bloc.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/bloc/cart_items_bloc/cart_items_bloc.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

import 'package:http/http.dart' as http;

part 'di.g.dart';

abstract class Injector {
  static KiwiContainer? container;
  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static get resolve => container!.resolve;

  @Register.factory(AllItemsBloc)
  @Register.factory(BottomNavigationBloc)
  @Register.factory(CartItemsBloc)
  @Register.factory(AddToCartUseCase)
  @Register.factory(RemoveFromCartUseCase)
  @Register.factory(GetCartItemsListUseCase)
  @Register.factory(FetchItemsListUseCase)
  @Register.factory(CartItemsRepository,
      from: CartItemsRepositoryImplementation)
  @Register.factory(CartItemsRemoteDataSource, from: RemoteDataSourceImpl)
  @Register.factory(http.Client)
  void _configure();
}
