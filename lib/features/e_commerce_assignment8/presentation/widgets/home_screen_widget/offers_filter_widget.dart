import 'package:e_commerce_assignment8/core/constants/textstyle_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/text_constants.dart';

class OffersAndFilterWidget extends StatelessWidget {
  const OffersAndFilterWidget({super.key, required this.offerText});
  final String offerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text(offerText, style: offerTextStyle),
          TextButton(
            onPressed: () {},
            child: const Text(seeAllButtonText, style: seeAllButtonTextStyle),
          )
        ],
      ),
    );
  }
}
