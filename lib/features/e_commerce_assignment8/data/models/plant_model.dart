import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/entities/plant_entity.dart';
import 'package:equatable/equatable.dart';

class PlantModel extends PlantEntity {
  PlantModel(
      {required super.plantImage,
      required super.plantName,
      required super.price,
      required super.plantsSold,
      required super.rating,
      required super.isAddedToCart});

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
        plantImage: json['plantImage'],
        plantName: json['plantName'],
        price: json['price'],
        plantsSold: json['plantsSold'],
        rating: json['rating'],
        isAddedToCart: json['isAddedToCart']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'plantImage': plantImage,
      'plantName': plantName,
      'price': price,
      'plantsSold': price,
      'rating': rating,
      'isAddedToCart': isAddedToCart
    };
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [plantImage, plantName, price, plantsSold, rating, isAddedToCart];
}
