import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';

class CredentialFormField extends StatefulWidget {
  CredentialFormField({
    super.key,
    required this.iconLeading,
    this.suffixIcon,
    required this.label,
  });
  final IconData iconLeading;
  IconData? suffixIcon;
  final String label;

  @override
  State<CredentialFormField> createState() => _CredentialFormFieldState();
}

class _CredentialFormFieldState extends State<CredentialFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: ColorConstants.loginCredentialContainerColor,
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        decoration: InputDecoration(
            icon: Icon(widget.iconLeading),
            labelText: widget.label,
            suffixIcon: Icon(widget.suffixIcon),
            border: InputBorder.none),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please provide ${widget.label}.';
          }
        },
      ),
    );
  }
}
