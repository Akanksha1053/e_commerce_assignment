import 'package:e_commerce_assignment8/core/constants/color_constants.dart';
import 'package:e_commerce_assignment8/core/constants/textstyle_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_items_bloc/cart_items_bloc.dart';
import 'counter_widget.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemsBloc, CartItemsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(left: 8),
          margin:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          height: MediaQuery.of(context).size.height / 4.2,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: ColorConstants.cartScreenTileColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: ColorConstants.imageContainerColor,
                        image: DecorationImage(
                            image: NetworkImage((state as CartItemsLoadedState)
                                .cartListItems[index]
                                .plantImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.cartListItems[index].plantName,
                      style: plantNameTextStyle,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16.0, left: 8, top: 10),
                    child: Text(
                      '\$${state.cartListItems[index].price.toString()}',
                      style: plantsPriceTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: CounterWidget(
                        itemToBeRemoved: state.cartListItems[index]),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
