import 'package:dartz/dartz.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/models/plant_model.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/entities/plant_entity.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/repositories/cart_items_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';

class AddToCartUseCase implements UseCase<List<PlantEntity>, AddToCartParam> {
  final CartItemsRepository addToCartRepository;
  AddToCartUseCase(this.addToCartRepository);
  @override
  Future<Either<Failure, List<PlantEntity>>> call(AddToCartParam params) async {
    return await addToCartRepository.addToCart(
        itemToBeAdded: params.itemToBeAdded);
  }
}

class AddToCartParam extends Equatable {
  final PlantEntity itemToBeAdded;

  const AddToCartParam({required this.itemToBeAdded});

  @override
  List<Object?> get props => [itemToBeAdded];
}
