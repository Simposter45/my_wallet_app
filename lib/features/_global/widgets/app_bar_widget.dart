import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/styles.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    required this.title,
    this.actionName,
    this.action,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? actionName;

  VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: AppTextStyles.poppins20Black,
      ),
      actions: [
        if (actionName != null)
          TextButton(
              onPressed: action,
              child: Text(actionName!, style: AppTextStyles.poppins16Blue)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
