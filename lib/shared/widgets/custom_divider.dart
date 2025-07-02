import 'package:cabzing/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.borderBlue,
            Colors.transparent,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
