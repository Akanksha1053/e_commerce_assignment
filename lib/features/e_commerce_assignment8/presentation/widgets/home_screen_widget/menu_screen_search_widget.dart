import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/text_constants.dart';
import '../../../../../core/constants/textstyle_constants.dart';

class MenuScreenSearch extends StatelessWidget {
  const MenuScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
            padding: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstants.searchBarColor),
            child: const TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: ColorConstants.searchBarIconColor,
                      size: 25,
                    ),
                    labelText: searchBarText,
                    labelStyle: searchBarTextStyle,
                    suffixIcon: Icon(
                      Icons.filter_list_outlined,
                      color: ColorConstants.searchBarFilterColor,
                    ),
                    border: InputBorder.none)),
          ),
        ),
      ],
    );
  }
}
