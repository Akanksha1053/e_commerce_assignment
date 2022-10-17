import 'package:e_commerce_assignment8/core/errors/exception.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/datasources/cart_items_remote_source.dart';
import 'package:e_commerce_assignment8/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/models/plant_model.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/entities/plant_entity.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/repositories/cart_items_repository.dart';

class CartItemsRepositoryImplementation implements CartItemsRepository {
  final CartItemsRemoteDataSource remoteDataSource;

  CartItemsRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PlantModel>>> getCartItems() async {
    try {
      final result = await remoteDataSource.getCartItems();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server failure occured'));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart({required itemToBeAdded}) async {
    try {
      final result =
          await remoteDataSource.removeFromCart(itemToBeAdded: itemToBeAdded);
      final list = result.fold((l) => [], (r) => r);
      return Right(null);
    } on ServerException {
      return const Left(ServerFailure('server failure occured'));
    }
  }

  @override
  Future<Either<Failure, List<PlantEntity>>> addToCart(
      {required itemToBeAdded}) async {
    try {
      final getStatus =
          await remoteDataSource.addToCart(itemToBeAdded: itemToBeAdded);
      final list = getStatus.fold((l) => [], (r) => r);
      return Right(list as List<PlantEntity>);
    } on InsertionFailure {
      return const Left(InsertionFailure('Failed to add in cart'));
    }
  }

  @override
  Future<Either<Failure, List<PlantEntity>>> getItems() async {
    try {
      final result = await remoteDataSource.getItems();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('server failure occured'));
    }
  }
}
