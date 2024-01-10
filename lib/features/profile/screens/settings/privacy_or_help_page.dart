import 'package:flutter/material.dart';

import '../../../../core/constants/styles.dart';
import '../../../_global/widgets/app_bar_widget.dart';

class PrivacyOrHelpPage extends StatelessWidget {
  const PrivacyOrHelpPage({
    required this.title,
    required this.desc,
    Key? key,
  }) : super(key: key);

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: title),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Text(
          desc,
          style: AppTextStyles.poppins14Black,
        ),
      ),
    );
  }
}
