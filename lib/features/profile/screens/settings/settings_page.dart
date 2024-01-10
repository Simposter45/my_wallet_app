import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/styles.dart';
import '../../../_global/widgets/app_bar_widget.dart';
import '../../store/profile_store.dart';
import 'currencies_page.dart';
import 'privacy_or_help_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileStore = context.read<ProfileStore>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => Provider.value(
                      value: profileStore, child: const CurrenciesPage()))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Currency',
                    style: AppTextStyles.poppins16Black,
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const PrivacyOrHelpPage(
                      title: 'Privacy Policy',
                      desc:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut neque libero. Sed volutpat risus id sem convallis, at sagittis urna malesuada. Integer convallis mi sit amet lectus facilisis, id vestibulum nunc viverra. Phasellus eu luctus sem. Nullam lacinia ipsum ac lacus auctor, at euismod justo feugiat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vehicula mi vel sagittis fermentum. Curabitur malesuada ex vitae nisi posuere, a congue magna gravida. Sed auctor turpis eget vestibulum sagittis. Nulla facilisi. Sed sed placerat est. Phasellus malesuada sagittis velit, at tincidunt leo posuere ac. Mauris sed tincidunt sapien, vel consequat dolor. Nullam dictum consequat orci, a fringilla risus consequat sit amet. Sed auctor turpis eget vestibulum sagittis. Nulla facilisi. Sed sed placerat est. Phasellus malesuada sagittis velit, at tincidunt leo posuere ac. Mauris sed tincidunt sapien, vel consequat dolor. Nullam dictum consequat orci, a fringilla risus consequat sit amet.'))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Privacy Policy',
                    style: AppTextStyles.poppins16Black,
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const PrivacyOrHelpPage(
                      title: 'Help',
                      desc:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut neque libero. Sed volutpat risus id sem convallis, at sagittis urna malesuada. Integer convallis mi sit amet lectus facilisis, id vestibulum nunc viverra. Phasellus eu luctus sem. Nullam lacinia ipsum ac lacus auctor, at euismod justo feugiat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vehicula mi vel sagittis fermentum. Curabitur malesuada ex vitae nisi posuere, a congue magna gravida. Sed auctor turpis eget vestibulum sagittis. Nulla facilisi. Sed sed placerat est. Phasellus malesuada sagittis velit, at tincidunt leo posuere ac. Mauris sed tincidunt sapien, vel consequat dolor. Nullam dictum consequat orci, a fringilla risus consequat sit amet. Sed auctor turpis eget vestibulum sagittis. Nulla facilisi. Sed sed placerat est. Phasellus malesuada sagittis velit, at tincidunt leo posuere ac. Mauris sed tincidunt sapien, vel consequat dolor. Nullam dictum consequat orci, a fringilla risus consequat sit amet.'))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Help',
                    style: AppTextStyles.poppins16Black,
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
