import 'package:flutter/material.dart';
import 'package:foodly_ui_intern/components/dot_navigation.dart';
import 'package:foodly_ui_intern/components/title_section.dart';
import 'package:foodly_ui_intern/constants.dart';

class ItemCard {
  final String url;
  final String title;
  final String description;
  final String time;
  final String delivery;
  final double rating;

  ItemCard({
    required this.url,
    required this.title,
    required this.description,
    required this.time,
    required this.delivery,
    required this.rating,
  });
}

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
            child: GestureDetector(
                onTap: () {},
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
                      itemBuilder: (context, index) =>
                          _buildBigCard(image: dataBigCard[index]),
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
              spacing: 12,
              children: [
                TitleSection(
                  title: "Features Partners",
                  actionTitle: "See All",
                  onPressAction: () {},
                ),
                SizedBox(
                  width: double.infinity,
                  height: 360,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataMediumCard.length,
                    itemBuilder: (context, index) => _buildMediumCard(
                        index: index,
                        itemCard: dataMediumCard[index],
                        length: dataMediumCard.length),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Padding _buildMediumCard(
      {required int index, required ItemCard itemCard, required int length}) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding,
        right: (length - 1) == index ? defaultPadding : 0,
      ),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                itemCard.url,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              itemCard.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 4),
            Text(
              itemCard.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 12),
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    itemCard.rating.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      itemCard.time,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      itemCard.delivery,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildBigCard({required String image}) {
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

List<ItemCard> dataMediumCard = [
  ItemCard(
    url: "assets/images/medium_1.png",
    title: "title_1",
    description: "description_1",
    time: "time_1",
    delivery: "delivery_1",
    rating: 4.5,
  ),
  ItemCard(
    url: "assets/images/medium_2.png",
    title: "title_2",
    description: "description_2",
    time: "time_2",
    delivery: "delivery_2",
    rating: 4.2,
  ),
  ItemCard(
    url: "assets/images/medium_3.png",
    title: "title_3",
    description: "description_3",
    time: "time_3",
    delivery: "delivery_3",
    rating: 4.8,
  ),
  ItemCard(
    url: "assets/images/medium_4.png",
    title: "title_4",
    description: "description_4",
    time: "time_4",
    delivery: "delivery_4",
    rating: 4.8,
  ),
];
