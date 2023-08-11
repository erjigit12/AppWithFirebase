import 'package:flutter/material.dart';

import '../constants/constants.dart';

class EmailPasswordFieldWidget extends StatelessWidget {
  const EmailPasswordFieldWidget({
    super.key,
    required this.text,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.onFieldSubmittedValue,
    this.onValidator,
    this.keyBoardType,
  });
  final String text;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? initialValue;

  final FocusNode? focusNode;
  final FormFieldSetter? onFieldSubmittedValue;
  final FormFieldValidator? onValidator;
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        focusNode: focusNode,
        validator: onValidator,
        onFieldSubmitted: onFieldSubmittedValue,
        keyboardType: keyBoardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: text,
          hintStyle: AppTextStyle.f20w0,
        ),
      ),
    );
  }
}
