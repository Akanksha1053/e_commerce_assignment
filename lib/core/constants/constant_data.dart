import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/models/plant_model.dart';

import '../../features/e_commerce_assignment8/domain/entities/plant_entity.dart';

class FilterOptions {
  final String filterName;
  final bool isSelected;
  FilterOptions(this.filterName, this.isSelected);
}

class Plants {
  static List<FilterOptions> filterList = [
    FilterOptions('All', true),
    FilterOptions('Monstera', false),
    FilterOptions('Aloe', false),
    FilterOptions('Palm', false),
    FilterOptions('Aloe', false),
    FilterOptions('Monstera', false),
  ];
}
