import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/text_constants.dart';
import '../../../../../core/constants/textstyle_constants.dart';

class MenuScreenAppBar extends StatelessWidget {
  const MenuScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.scaffoldBackgroundColor,
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      //Row for profile
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://static.remove.bg/remove-bg-web/37843dee2531e43723b012aa78be4b91cc211fef/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png'),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: ListTile(
              title: Row(
                children: const [
                  Text(
                    goodMorningText,
                    style:
                        TextStyle(color: ColorConstants.goodMorningTextColor),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.waving_hand,
                    color: ColorConstants.wavingHandColor,
                    size: 20,
                  )
                ],
              ),
              subtitle: const Text(userNameText, style: userNameTextStyle),
              // trailing:
            ),
          ),
          const CircleAvatar(
            backgroundColor: ColorConstants.appbarBackgroundColor,
            radius: 24,
            child: Icon(
              Icons.notifications_none_outlined,
              color: ColorConstants.homeMenuScreenIconColor,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const CircleAvatar(
            backgroundColor: ColorConstants.appbarBackgroundColor,
            radius: 24,
            child: Icon(
              Icons.favorite_border_outlined,
              color: ColorConstants.homeMenuScreenIconColor,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
