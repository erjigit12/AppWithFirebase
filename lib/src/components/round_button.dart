import 'package:flutter/material.dart';

import '../constants/profile_constants/colors/profile_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.title,
    this.onPressed,
    this.loading = false,
  });

  final String title;
  final void Function()? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppProfileColors.textButtonGrey),
        onPressed: onPressed,
        child: loading ? const CircularProgressIndicator() : Text(title),
      ),
    );
  }
}
