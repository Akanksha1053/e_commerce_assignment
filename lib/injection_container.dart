import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/datasources/cart_items_remote_source.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/repositories/cart_items_repository.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/fetch_items.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/remove_from_cart.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/bloc/all_items_bloc/all_items_bloc.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc_bloc.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/presentation/bloc/cart_items_bloc/cart_items_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/e_commerce_assignment8/domain/repositories/cart_items_repository.dart';
import 'features/e_commerce_assignment8/domain/usecases/add_cart_item.dart';
import 'features/e_commerce_assignment8/domain/usecases/get_cart_items.dart';

final sL = GetIt.instance;

void init() {
  //bloc
  sL.registerFactory(
    () => CartItemsBloc(sL(), sL()),
  );
  sL.registerFactory(
    () => AllItemsBloc(sL(), sL(), sL(), sL()),
  );
  sL.registerFactory(
    () => BottomNavigationBloc(),
  );

//use cases
  sL.registerLazySingleton(() => GetCartItemsListUseCase(sL()));
  sL.registerLazySingleton(() => AddToCartUseCase(sL()));
  sL.registerLazySingleton(() => RemoveFromCartUseCase(sL()));
  sL.registerLazySingleton(() => FetchItemsListUseCase(sL()));

//repository
  sL.registerLazySingleton<CartItemsRepository>(
      () => CartItemsRepositoryImplementation(remoteDataSource: sL()));

//data sources
  sL.registerLazySingleton<CartItemsRemoteDataSource>(
      () => RemoteDataSourceImpl(client: sL()));

//external
  sL.registerLazySingleton(() => http.Client());
}
