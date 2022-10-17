import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/text_constants.dart';
import '../../../../../core/constants/textstyle_constants.dart';
import 'cart_checkoutbutton.dart';

class CartBottomPriceContainer extends StatelessWidget {
  const CartBottomPriceContainer({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width / 1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            color: ColorConstants.cartScreenTileColor),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      totalPriceText,
                      style: totalPriceTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '\$$totalPrice',
                      style: totalPriceStyle,
                    ),
                  ),
                ],
              ),
              const CartCheckoutButton()
            ]),
      ),
    );
  }
}
