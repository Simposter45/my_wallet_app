import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Forgot Password',
              textAlign: TextAlign.center,
              style: AppTextStyles.poppins30Blackbold,
            ),
            SizedBox(height: 10),
            Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              textAlign: TextAlign.center,
              style: AppTextStyles.poppins14Grey,
            )
          ],
        ),
      ),
    );
  }
}
