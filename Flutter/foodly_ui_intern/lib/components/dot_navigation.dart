import 'package:flutter/material.dart';
import 'package:foodly_ui_intern/constants.dart';

class DotNavigation extends StatelessWidget {
  const DotNavigation({
    super.key,
    this.isActive = false,
    this.activeColor = primaryColor,
    this.inActiveColor = Colors.grey,
    this.activeWidth = 10,
    this.styleDot = "Primary",
  });

  final bool isActive;
  final Color activeColor, inActiveColor;
  final double activeWidth;
  final String styleDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? activeWidth : 5,
      height: 5,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: isActive ? activeColor : inActiveColor,
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }
}
