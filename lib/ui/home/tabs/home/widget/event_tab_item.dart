import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String event;
  Color? borderColor;
  Color selectedBgColor;
  TextStyle selectedTextStyle;
  TextStyle unselectedTextStyle;

  EventTabItem(
      {super.key,
      required this.isSelected,
      required this.event,
      this.borderColor,
      required this.selectedBgColor,
      required this.selectedTextStyle,
      required this.unselectedTextStyle});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * .01, horizontal: screenWidth * .02),
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * .01, horizontal: screenWidth * .02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          width: 1,
          color: borderColor ?? Theme.of(context).focusColor,
        ),
        color: isSelected ? selectedBgColor : Colors.transparent,
      ),
      child: Text(
        event,
        style: isSelected ? selectedTextStyle : unselectedTextStyle,
      ),
    );
  }
}
