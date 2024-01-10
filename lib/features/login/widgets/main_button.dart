import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.action,
    required this.buttonName,
    Key? key,
  }) : super(key: key);

  final VoidCallback action;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.blue),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            buttonName,
            style: AppTextStyles.poppins20Whitebold,
          ),
        ),
      ),
    );
  }
}
