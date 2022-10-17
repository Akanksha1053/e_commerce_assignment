import 'package:dartz/dartz.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/models/plant_model.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/entities/plant_entity.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/repositories/cart_items_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';

class RemoveFromCartUseCase implements UseCase<void, RemoveFromCartParam> {
  final CartItemsRepository removeFromCartRepository;
  RemoveFromCartUseCase(this.removeFromCartRepository);
  @override
  Future<Either<Failure, void>> call(RemoveFromCartParam params) async {
    return await removeFromCartRepository.removeFromCart(
        itemToBeAdded: params.itemToBeAdded);
  }
}

class RemoveFromCartParam extends Equatable {
  final PlantEntity itemToBeAdded;

  const RemoveFromCartParam({required this.itemToBeAdded});

  @override
  List<Object?> get props => [itemToBeAdded];
}
