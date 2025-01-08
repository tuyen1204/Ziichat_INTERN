import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_ui_intern/components/dot_navigation.dart';
import 'package:foodly_ui_intern/constants.dart';
import 'package:foodly_ui_intern/screens/authenticator/sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
              ),
              Flexible(
                flex: 5,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingItem(
                      image: onboardingData[index]['image']!,
                      title: onboardingData[index]['title']!,
                      text: onboardingData[index]['text']!,
                    );
                  },
                  onPageChanged: (value) => setState(() {
                    currentPage = value;
                  }),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => DotNavigation(
                      isActive: index == currentPage,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ));
                  },
                  child: Text("Get started".toUpperCase())),
              SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> onboardingData = [
  {
    'image': 'assets/illustrations/Illustrations_1.svg',
    "title": "All your favorites",
    "text":
        "Order from the best local restaurants \nwith easy, on-demand delivery.",
  },
  {
    'image': 'assets/illustrations/Illustrations_2.svg',
    "title": "Free delivery offers",
    "text":
        "Free delivery for new customers via Apple Pay\nand others payment methods.",
  },
  {
    'image': 'assets/illustrations/Illustrations_3.svg',
    "title": "Choose your food",
    "text":
        "Easily find your type of food craving and\nyou’ll get delivery in wide range.",
  },
];

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  final String image, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SvgPicture.asset(image),
        ),
        SizedBox(height: 32),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
