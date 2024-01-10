import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import 'onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const OnboardingScreens()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.blue),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/png/app_logo_white.png'),
              const SizedBox(height: 10),
              const Text(
                'WealthWise',
                style: AppTextStyles.poppins20Whitebold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
