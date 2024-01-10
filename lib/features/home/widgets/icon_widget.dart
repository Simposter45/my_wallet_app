import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

// ignore: must_be_immutable
class IconWidget extends StatelessWidget {
  const IconWidget({
    required this.icon,
    Key? key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Icon(
          icon,
          color: AppColors.blue,
        ),
      ),
    );
  }
}
