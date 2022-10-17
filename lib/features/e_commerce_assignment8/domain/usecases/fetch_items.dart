import 'package:dartz/dartz.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/models/plant_model.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/entities/plant_entity.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/repositories/cart_items_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';

class FetchItemsListUseCase
    implements UseCase<List<PlantEntity>, FetchItemsListNoParams> {
  final CartItemsRepository getItemsRepository;
  FetchItemsListUseCase(this.getItemsRepository);
  @override
  Future<Either<Failure, List<PlantEntity>>> call(
      FetchItemsListNoParams noParams) async {
    return await getItemsRepository.getItems();
  }
}

class FetchItemsListNoParams {}
