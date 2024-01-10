import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../model/expenses_model.dart';
import '../screens/item_details_screen.dart';
import '../screens/see_all_page.dart';
import '../store/home_store.dart';
import 'expense_list_widget.dart';
import 'icon_widget.dart';

// ignore: must_be_immutable
class HomeSection extends StatelessWidget {
  const HomeSection({
    required this.header,
    required this.imageName,
    required this.emptytext,
    required this.dialogContent,
    Key? key,
  }) : super(key: key);

  final String header;
  final String imageName;
  final String emptytext;
  final String dialogContent;

  void showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: SvgPicture.asset('assets/svg/info_blue_icon.svg'),
            title: const Text(
              'About',
              style: AppTextStyles.poppins20Black,
            ),
            content: Text(
              dialogContent,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppins14Grey2,
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
    final expenseStore = context.read<HomeStore>();

    return Observer(builder: (context) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                header,
                style: AppTextStyles.poppins20Black,
              ),
              const SizedBox(width: 15),
              GestureDetector(
                  onTap: () => showDialogBox(context),
                  child: SvgPicture.asset('assets/svg/info_button.svg')),
              const Expanded(child: SizedBox()),
              if (expenseStore.expenseItems.isNotEmpty)
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Provider.value(
                            value: expenseStore,
                            child: const SeeAllPage(
                              pageTitle: 'Expenses',
                            ),
                          ))),
                  child: const Text(
                    'See All',
                    style: AppTextStyles.poppins16Blue,
                  ),
                )
            ],
          ),
          const SizedBox(height: 20),
          if (expenseStore.expenseItems.isNotEmpty)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 370),
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Column(
                        children: [
                          Divider(),
                          SizedBox(height: 10),
                        ],
                      ),
                  shrinkWrap: true,
                  itemCount: expenseStore.expenseItems.length,
                  itemBuilder: (context, index) {
                    return ExpenseListWidget(
                        expenseStore: expenseStore, index: index);
                  }),
            ),
          if (expenseStore.expenseItems.isEmpty)
            Column(
              children: [
                Image.asset('assets/png/$imageName.png'),
                const SizedBox(width: 10),
                Text(
                  emptytext,
                  style: AppTextStyles.poppins14Grey2,
                )
              ],
            ),
        ],
      );
    });
  }
}
