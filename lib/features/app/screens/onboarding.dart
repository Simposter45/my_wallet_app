import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../login/screens/sign_up_screen_variant1.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final pageController = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: const [
            OnBoardingPage(
              title: 'Gain total control of your money',
              desc: 'Become your own money manager and make every cent count',
              image: 'assets/png/onboarding_page_1.png',
            ),
            OnBoardingPage(
              title: 'Gain total control of your money',
              desc: 'Become your own money manager and make every cent count',
              image: 'assets/png/onboarding_page_2.png',
            ),
            OnBoardingPage(
              title: 'Gain total control of your money',
              desc: 'Become your own money manager and make every cent count',
              image: 'assets/png/onboarding_page_3.png',
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const WormEffect(
                activeDotColor: AppColors.blue,
                spacing: 16,
              ),
              onDotClicked: (index) => pageController.animateToPage(
                index,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 300),
              ),
            ),
            IconButton(
                onPressed: () {
                  isLastPage
                      ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignUpScreen()))
                      : pageController.nextPage(
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 300));
                },
                icon: const Icon(Icons.arrow_right_alt_rounded))
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    required this.title,
    required this.desc,
    required this.image,
    Key? key,
  }) : super(key: key);

  final String title;
  final String desc;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.poppins30Blackbold,
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: AppTextStyles.poppins14Grey,
          )
        ],
      ),
    );
  }
}
