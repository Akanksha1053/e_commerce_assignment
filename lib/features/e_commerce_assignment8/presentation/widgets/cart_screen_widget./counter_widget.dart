import 'package:e_commerce_assignment8/core/constants/color_constants.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/data/models/plant_model.dart';
import 'package:e_commerce_assignment8/features/e_commerce_assignment8/domain/entities/plant_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_items_bloc/cart_items_bloc.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
    required this.itemToBeRemoved,
  }) : super(key: key);

  final PlantEntity itemToBeRemoved;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemsBloc, CartItemsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: ColorConstants.cartScreenColor),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16, right: 10),
                    child: Icon(
                      Icons.minimize,
                      size: 25,
                      color: ColorConstants.bottomNavigationActiveIconColor,
                    ),
                  ),
                  Text(
                    '2',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorConstants.plantsSoldTextColor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.add,
                      size: 25,
                      color: ColorConstants.bottomNavigationActiveIconColor,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                size: 20,
              ),
              color: ColorConstants.appbarIconColor,
              onPressed: () {
                if (state is CartItemsLoadedState) {
                  BlocProvider.of<CartItemsBloc>(context)
                      .add(RemoveFromCartEvent(item: itemToBeRemoved));
                }
              },
            )
          ],
        );
      },
    );
  }
}
