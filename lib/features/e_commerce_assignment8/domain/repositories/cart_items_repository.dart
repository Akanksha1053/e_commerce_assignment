import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/plant_entity.dart';

//! Contract
abstract class CartItemsRepository {
  Future<Either<Failure, List<PlantEntity>>> addToCart(
      {required itemToBeAdded});
  Future<Either<Failure, List<PlantEntity>>> getCartItems();
  Future<Either<Failure, void>> removeFromCart({required itemToBeAdded});
  Future<Either<Failure, List<PlantEntity>>> getItems();
}
