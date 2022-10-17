import 'package:equatable/equatable.dart';

class PlantEntity extends Equatable {
  final String plantImage;
  final String plantName;
  final num rating;
  final num price;
  final num plantsSold;
  bool isAddedToCart = false;

  PlantEntity(
      {required this.plantImage,
      required this.plantName,
      required this.price,
      required this.plantsSold,
      required this.rating,
      required this.isAddedToCart});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [plantImage, plantName, price, plantsSold, rating, isAddedToCart];
}
