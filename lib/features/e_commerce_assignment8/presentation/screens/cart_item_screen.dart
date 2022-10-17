import 'package:e_commerce_assignment8/core/constants/color_constants.dart';
import 'package:e_commerce_assignment8/core/constants/textstyle_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/text_constants.dart';
import '../bloc/cart_items_bloc/cart_items_bloc.dart';
import '../widgets/cart_screen_widget./cart_bottomprice_container.dart';
import '../widgets/cart_screen_widget./cart_item_tile.dart';

class CartItemsScreen extends StatelessWidget {
  const CartItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.cartScreenColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.cartScreenColor,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 50),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset('assets/images/cart_icon.png'),
            const SizedBox(
              width: 10,
            ),
            const Text(
              cartScreenTitleText,
              style: cartScreenTitleTextStyle,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.9,
            ),
            const Icon(
              Icons.search_outlined,
              color: ColorConstants.appbarIconColor,
              size: 35,
            )
          ]),
        ),
      ),
      body:
          BlocBuilder<CartItemsBloc, CartItemsState>(builder: (context, state) {
        if (state is CartItemsInitial) {
          BlocProvider.of<CartItemsBloc>(context).add(FetchCartItemEvent());
          return const Center(child: CircularProgressIndicator());
        } else {
          BlocProvider.of<CartItemsBloc>(context).add(FetchCartItemEvent());
          if ((state as CartItemsLoadedState).cartListItems.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 0,
                ),
                ClipRRect(
                  child: Image(
                    image: const AssetImage(
                      'assets/images/empty_cart.png',
                    ),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
                const Text(
                  emptyCartListTitle,
                  style: emptyCartListTitleTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  emptyCartListText,
                  style: emptyCartListTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            );
          } else {
            num totalPrice = 0;
            for (var element in (state).cartListItems) {
              totalPrice = totalPrice + element.price;
            }
            return Stack(children: [
              ListView.builder(
                itemCount: (state).cartListItems.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Row(
                  children: [
                    CartItemTile(index: index),
                  ],
                ),
              ),
              CartBottomPriceContainer(totalPrice: totalPrice)
            ]);
          }
        }
      }),
    );
  }
}
