import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  Text buttonText;
  Color backgroundColor;
  CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.backgroundColor = AppColors.bluePrimaryColor});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(vertical: screenHeight * .015),
      ),
      onPressed: onPressed,
      child: buttonText,
    );
  }
}
