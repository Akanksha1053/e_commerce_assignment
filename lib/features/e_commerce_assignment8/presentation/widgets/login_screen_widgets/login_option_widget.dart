import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';

class LoginOptionWidget extends StatelessWidget {
  const LoginOptionWidget({super.key, required this.color, required this.icon});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: ColorConstants.loginOptionContainerBorderColor,
                width: 1)),
        child: IconButton(
          onPressed: null,
          icon: Icon(icon, color: color),
          iconSize: 30,
        ),
      ),
    );
  }
}
