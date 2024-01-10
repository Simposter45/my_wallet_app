import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../widgets/main_button.dart';
import 'onboarding_qa.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Fill your Profile',
          style: AppTextStyles.poppins30Blackbold.copyWith(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Align(
                child: Stack(alignment: Alignment.bottomRight, children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.borderGrey,
                    child: Image.asset(
                      'assets/png/app_logo_blue.png',
                    ),
                  ),
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add_a_photo_outlined),
                  )
                ]),
              ),
              const SizedBox(height: 30),
              const Text(
                'Name',
                style: AppTextStyles.poppins14Black,
              ),
              const SizedBox(height: 7),
              TextField(
                autofocus: true,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your Name',
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
                'Email',
                style: AppTextStyles.poppins14Black,
              ),
              const SizedBox(height: 7),
              TextField(
                autofocus: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
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
                'Mobile Number',
                style: AppTextStyles.poppins14Black,
              ),
              const SizedBox(height: 7),
              // IntlPhoneField(),
              TextField(
                autofocus: true,
                controller: mobileController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your Mobile Number',
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
              const SizedBox(height: 60),
              MainButton(
                buttonName: 'Create Profile',
                action: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OnBoardingQA())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
