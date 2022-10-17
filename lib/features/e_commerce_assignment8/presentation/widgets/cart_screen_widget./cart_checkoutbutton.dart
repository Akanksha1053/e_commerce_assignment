import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/text_constants.dart';
import '../../../../../core/constants/textstyle_constants.dart';

class CartCheckoutButton extends StatelessWidget {
  const CartCheckoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(ColorConstants.checkoutButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              checkoutButtonText,
              style: checkoutButtonTextStyle,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.forward_sharp,
              size: 20,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
