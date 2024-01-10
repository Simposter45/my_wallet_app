import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../store/profile_store.dart';
import 'contact_us_screen.dart';
import 'edit_profile_screen.dart';
import 'manage_categories_screen.dart';
import 'settings/settings_page.dart';
import 'survey_form_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileStore = context.read<ProfileStore>();
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.borderGrey,
                    backgroundImage:
                        AssetImage('assets/png/profile_picture.png'),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'UserName',
                        style: AppTextStyles.poppins14Grey,
                      ),
                      Text(
                        'Olivia Smith',
                        style: AppTextStyles.poppins20Blackbold,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                            builder: (context) => Provider.value(
                                value: profileStore,
                                child: const EditProfile()))),
                    icon: SvgPicture.asset(
                      'assets/svg/edit.svg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProfileListItem(
                        icon: Icons.settings_rounded,
                        name: 'Settings',
                        action: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => Provider.value(
                                    value: profileStore,
                                    child: const SettingsPage()))),
                      ),
                      const SizedBox(height: 15),
                      ProfileListItem(
                        icon: Icons.category_rounded,
                        name: 'Manage Categories',
                        action: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => Provider.value(
                                    value: profileStore,
                                    child: ManageCategoriesScreen()))),
                      ),
                      const SizedBox(height: 15),
                      ProfileListItem(
                        icon: Icons.contact_support_rounded,
                        name: 'Contact Us',
                        action: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Provider.value(
                                    value: profileStore,
                                    child: ContactUsScreen()))),
                      ),
                      const SizedBox(height: 15),
                      ProfileListItem(
                        icon: Icons.pageview_rounded,
                        name: 'Survey Form',
                        action: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Provider.value(
                                    value: profileStore,
                                    child: SurveyFormScreen()))),
                      ),
                      const SizedBox(height: 15),
                      ProfileListItem(
                        icon: Icons.logout_rounded,
                        name: 'Logout',
                        action: () {},
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.account_circle_rounded,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Delete Account',
                            style: AppTextStyles.poppins14Red.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    required this.icon,
    required this.name,
    required this.action,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String name;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            name,
            style: AppTextStyles.poppins16Black,
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
