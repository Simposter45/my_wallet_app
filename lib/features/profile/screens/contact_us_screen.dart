import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../../login/widgets/main_button.dart';
import '../store/profile_store.dart';
import '../widgets/check_box_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({
    Key? key,
  }) : super(key: key);

  void showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/png/contact_us_dialog.png'),
                const Text(
                  'We have received your message and will respond as soon as possible.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.poppins14Grey2,
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      side: const MaterialStatePropertyAll(
                          BorderSide(color: AppColors.blue)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('OK'),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.read<ProfileStore>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Contact Us'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Let's get in touch!",
                  style: AppTextStyles.poppins14Black),
              Image.asset(
                'assets/png/contact_us.png',
                height: 149,
                width: 149,
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: AppTextStyles.poppins14Grey
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter email',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: AppTextStyles.poppins16Black
                        .copyWith(color: AppColors.borderGrey),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Subject",
                  style: AppTextStyles.poppins14Blue
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  CheckBoxWidget(
                    text: 'General Inquiry',
                    index: 0,
                  ),
                  CheckBoxWidget(
                    text: 'General Inquiry',
                    index: 1,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  CheckBoxWidget(
                    text: 'Technical Support',
                    index: 2,
                  ),
                  CheckBoxWidget(
                    text: 'Other Inquiry',
                    index: 3,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Message",
                  style: AppTextStyles.poppins14Grey
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                maxLines: null,
                style: AppTextStyles.poppins14Black,
                onChanged: (val) {},
                decoration: InputDecoration(
                  fillColor: AppColors.lightGrey,
                  filled: true,
                  constraints: const BoxConstraints(minHeight: 100),
                  hintText: 'Write your notes...',
                  hintStyle: AppTextStyles.poppins14Grey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MainButton(
                  action: () => showDialogBox(context), buttonName: 'Send'),
            ],
          ),
        ),
      ),
    );
  }
}
