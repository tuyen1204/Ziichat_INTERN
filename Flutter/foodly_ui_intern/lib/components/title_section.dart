import 'package:flutter/material.dart';
import 'package:foodly_ui_intern/constants.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.onPressAction,
  });

  final String title;
  final String actionTitle;
  final Function() onPressAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
              ),
              GestureDetector(
                onTap: onPressAction,
                child: Text(
                  actionTitle,
                  style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
