import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../widgets/main_button.dart';
import 'create_profile.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Account',
                  style: AppTextStyles.poppins30Blackbold,
                ),
                const SizedBox(height: 40),
                const Text(
                  'Email',
                  style: AppTextStyles.poppins14Black,
                ),
                const SizedBox(height: 7),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  onChanged: (val) {},
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.borderGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.borderGrey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Password',
                  style: AppTextStyles.poppins14Black,
                ),
                const SizedBox(height: 7),
                TextField(
                  // autofocus: true,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.borderGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.borderGrey),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const SizedBox(width: 10),
                    const Text(
                      'I accept the terms and privacy policy',
                      style: AppTextStyles.poppins14Black,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                MainButton(
                    buttonName: 'Sign Up',
                    action: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CreateProfile(),
                          ),
                        )),
                const SizedBox(height: 25),
                const Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.borderGrey)),
                    SizedBox(width: 5),
                    Text('Or Register With'),
                    SizedBox(width: 5),
                    Expanded(child: Divider(color: AppColors.borderGrey)),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.borderGrey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/facebook_ic.svg',
                            height: 26,
                            width: 26,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.borderGrey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/google_ic.svg',
                            height: 26,
                            width: 26,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.borderGrey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/cib_apple.svg',
                            height: 26,
                            width: 26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already Have an Account? ',
                      style: AppTextStyles.poppins14Black,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'LogIn',
                        style: AppTextStyles.poppins14Black
                            .copyWith(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
