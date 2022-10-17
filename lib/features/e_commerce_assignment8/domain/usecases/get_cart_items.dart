import 'package:dartz/dartz.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/models/plant_model.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/entities/plant_entity.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/repositories/cart_items_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetCartItemsListUseCase
    implements UseCase<List<PlantEntity>, GetCartItemsListNoParams> {
  final CartItemsRepository getCartItemsRepository;
  GetCartItemsListUseCase(this.getCartItemsRepository);
  @override
  Future<Either<Failure, List<PlantEntity>>> call(
      GetCartItemsListNoParams noParams) async {
    return await getCartItemsRepository.getCartItems();
  }
}

class GetCartItemsListNoParams {}
