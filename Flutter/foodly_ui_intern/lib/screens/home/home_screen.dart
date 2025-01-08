import 'package:flutter/material.dart';
import 'package:foodly_ui_intern/components/dot_navigation.dart';
import 'package:foodly_ui_intern/components/title_section.dart';
import 'package:foodly_ui_intern/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
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
            SizedBox(height: defaultPadding),
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: SizedBox(
                    height: 240,
                    child: PageView.builder(
                      itemCount: dataBigCard.length,
                      itemBuilder: (context, index) => Center(
                        child: BigCard(
                          image: dataBigCard[index],
                        ),
                      ),
                      onPageChanged: (value) => setState(() {
                        currentPage = value;
                      }),
                    ),
                  ),
                ),
                Positioned(
                  right: 24,
                  bottom: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      dataBigCard.length,
                      (index) => DotNavigation(
                        isActive: index == currentPage,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: spacingSection),
            Column(
              spacing: 20,
              children: [
                TitleSection(
                  title: "Features Partners",
                  actionTitle: "See All",
                  onPressAction: () {},
                ),
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: defaultPadding),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/image-1.jpg',
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: double.maxFinite,
          )),
    );
  }
}

List<String> dataBigCard = [
  "assets/images/big_1.png",
  "assets/images/big_2.png",
  "assets/images/big_3.png",
];
