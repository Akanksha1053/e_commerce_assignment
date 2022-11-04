// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => AllItemsBloc(
          c<AddToCartUseCase>(),
          c<GetCartItemsListUseCase>(),
          c<RemoveFromCartUseCase>(),
          c<FetchItemsListUseCase>()))
      ..registerFactory((c) => BottomNavigationBloc())
      ..registerFactory((c) => CartItemsBloc(
          c<GetCartItemsListUseCase>(), c<RemoveFromCartUseCase>()))
      ..registerFactory((c) => AddToCartUseCase(c<CartItemsRepository>()))
      ..registerFactory((c) => RemoveFromCartUseCase(c<CartItemsRepository>()))
      ..registerFactory(
          (c) => GetCartItemsListUseCase(c<CartItemsRepository>()))
      ..registerFactory((c) => FetchItemsListUseCase(c<CartItemsRepository>()))
      ..registerFactory<CartItemsRepository>((c) =>
          CartItemsRepositoryImplementation(
              remoteDataSource: c<CartItemsRemoteDataSource>()))
      ..registerFactory<CartItemsRemoteDataSource>(
          (c) => RemoteDataSourceImpl(client: c<Client>()))
      ..registerFactory((c) => Client());
  }
}
