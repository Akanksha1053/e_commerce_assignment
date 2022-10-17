import 'dart:convert';
import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:e_commerce_assignment8/core/constants/constant_data.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/models/plant_model.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/entities/plant_entity.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/usecases/remove_from_cart.dart';

import '../../../../core/constants/url.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import 'package:http/http.dart' as http;

abstract class CartItemsRemoteDataSource {
  Future<Either<Failure, List<PlantModel>>> addToCart({required itemToBeAdded});
  Future<List<PlantModel>> getCartItems();
  Future<Either<Failure, void>> removeFromCart({required itemToBeAdded});
  Future<List<PlantModel>> getItems();
}

class RemoteDataSourceImpl implements CartItemsRemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

//get all items from the database
  @override
  Future<List<PlantModel>> getItems() async {
    final response = await client.get(Uri.parse(Url.baseUrl));
    List<PlantModel> allItemsList = [];
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data == null) {
        return [];
      }
      data.forEach((key, value) {
        allItemsList.add(PlantModel.fromJson(value));
      });
      return allItemsList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PlantModel>> getCartItems() async {
    final response = await client.get(Uri.parse(Url.cartUrl));
    List<PlantModel> cartItemsList = [];
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data == null) {
        return [];
      }
      data.forEach((key, value) {
        cartItemsList.add(PlantModel.fromJson(value));
      });
      return cartItemsList;
    } else {
      throw ServerException();
    }
  }

//add item to the cart
  @override
  Future<Either<Failure, List<PlantModel>>> addToCart(
      {required itemToBeAdded}) async {
    try {
      itemToBeAdded.isAddedToCart = !itemToBeAdded.isAddedToCart;
      final response = await client.post(Uri.parse(Url.cartUrl),
          body: json.encode(itemToBeAdded.toJson()));

      //update in all items list
      final fetched = await client.get(Uri.parse(Url.baseUrl));
      List<PlantModel> allItemsList = [];
      if (response.statusCode == 200) {
        final data = json.decode(fetched.body);
        data.forEach((key, value) {
          allItemsList.add(PlantModel.fromJson(value));
          if (PlantModel.fromJson(value).plantName == itemToBeAdded.plantName) {
            update(itemToBeAdded, key);
          }
        });
        int index = allItemsList.indexWhere(
            (element) => element.plantName == itemToBeAdded.plantName);
        allItemsList[index].isAddedToCart = true;
      }
      return Right(allItemsList);
    } on InsertionFailure {
      return const Left(InsertionFailure('Failed to add in cart'));
    }
  }

  void update(PlantModel updatedItem, key) async {
    await http.patch(
        Uri.parse(
            'https://plantecommerce-assignment-default-rtdb.firebaseio.com/Items/$key.json'),
        body: json.encode({
          'plantName': updatedItem.plantName,
          'isAddedToCart': updatedItem.isAddedToCart,
          'plantImage': updatedItem.plantImage,
          'price': updatedItem.price,
          'plantsSold': updatedItem.plantsSold,
          'rating': updatedItem.rating
        }));
    return;
  }

  @override
  Future<Either<Failure, void>> removeFromCart({required itemToBeAdded}) async {
    try {
      final response = await client.get(Uri.parse(Url.cartUrl));
      itemToBeAdded.isAddedToCart = false;
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null) {
          data.forEach((key, value) async {
            if ((PlantModel.fromJson(value).plantName ==
                itemToBeAdded.plantName)) {
              await client.delete(Uri.parse(
                  'https://plantecommerce-assignment-default-rtdb.firebaseio.com/cart/$key.json'));
            }
          });
        }
        final fetched = await client.get(Uri.parse(Url.baseUrl));
        List<PlantModel> allItemsList = [];
        if (response.statusCode == 200) {
          final data = json.decode(fetched.body);
          data.forEach((key, value) {
            allItemsList.add(PlantModel.fromJson(value));
            if (PlantModel.fromJson(value).plantName ==
                itemToBeAdded.plantName) {
              update(itemToBeAdded, key);
            }
          });
          int index = allItemsList.indexWhere(
              (element) => element.plantName == itemToBeAdded.plantName);
          allItemsList[index].isAddedToCart = true;
        }
      }
      return Right(null);
    } on InsertionFailure {
      return const Left(InsertionFailure('Failed to remove from cart'));
    }
  }
}
