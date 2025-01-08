import 'package:flutter/material.dart';
import 'package:foodly_ui_intern/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Column(
          spacing: 4,
          children: [
            Text(
              "Delivery to".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: primaryColor),
            ),
            Text("San Francisco",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w700)),
          ],
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 8),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Filter",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage("assets/images/big_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
