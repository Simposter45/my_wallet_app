import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../login/widgets/main_button.dart';
import '../model/expenses_model.dart';
import '../screens/item_details_screen.dart';
import '../store/home_store.dart';
import 'icon_widget.dart';

class ExpenseListWidget extends StatelessWidget {
  const ExpenseListWidget({
    required this.expenseStore,
    required this.index,
    Key? key,
  }) : super(key: key);

  final HomeStore expenseStore;
  final int index;

  void showDialogBox(BuildContext context, ExpenseModel expenseModel,
      bool isPaid, String content, double amount) {
    final store = context.read<HomeStore>();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Observer(
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/png/expenses_dialogbox_icon.png'),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppins14Grey2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$${amount.toString()}",
                        textAlign: TextAlign.center,
                        style:
                            AppTextStyles.poppins16Blue.copyWith(fontSize: 22),
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: store.setIsEditOn,
                          icon: const Icon(
                            Icons.edit_rounded,
                            size: 18,
                          ))
                    ],
                  ),
                  if (isPaid)
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            AppColors.red),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)))),
                                onPressed: () {
                                  expenseStore.setStatus(expenseModel);

                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Yes',
                                  style: AppTextStyles.poppins10White
                                      .copyWith(fontSize: 14),
                                ))),
                        const SizedBox(width: 20),
                        Expanded(
                            child: OutlinedButton(
                                style: ButtonStyle(
                                    side: const MaterialStatePropertyAll(
                                        BorderSide(
                                            color: AppColors.mediumGrey)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)))),
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Cancel',
                                  style: AppTextStyles.poppins14Black,
                                )))
                        // Text('data'),
                      ],
                    )
                  else
                    store.isEditOn
                        ? MainButton(action: () {}, buttonName: 'Save')
                        : MainButton(
                            action: () {
                              expenseStore.setStatus(expenseModel);

                              Navigator.pop(context);
                            },
                            buttonName: 'Mark as paid')
                ],
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final expenseModel = expenseStore.expenseItems[index];

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Provider.value(
                  value: expenseStore,
                  child: ItemDetailsScreen(isExpense: true, index: index)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconWidget(icon: expenseModel.icon),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                expenseModel.itemName,
                style: AppTextStyles.poppins20Black.copyWith(fontSize: 16),
              ),
              Text(
                '28th Sept',
                style: AppTextStyles.poppins14Grey.copyWith(fontSize: 11),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (context) => OutlinedButton(
                  style: ButtonStyle(
                      minimumSize:
                          const MaterialStatePropertyAll(Size(150, 33)),
                      backgroundColor: MaterialStatePropertyAll(
                          expenseModel.status ? AppColors.blue : Colors.white),
                      side: MaterialStatePropertyAll(BorderSide(
                          color: expenseModel.status
                              ? Colors.transparent
                              : AppColors.blue))),
                  onPressed: () {
                    showDialogBox(
                      context,
                      expenseModel,
                      expenseModel.status,
                      expenseModel.status
                          ? 'Are you sure you want to mark as unpaid?'
                          : 'Have you paid the ${expenseModel.itemName} Bills?',
                      expenseModel.amount,
                    );
                    // expenseStore.setStatus(expenseModel);
                  },
                  child: Text(
                    expenseModel.status ? 'Paid' : 'Mark as Paid',
                    style: expenseModel.status
                        ? AppTextStyles.poppins20Whitebold
                        : AppTextStyles.poppins16Blue,
                  ),
                ),
              )
            ],
          ),
          const Expanded(
            child: SizedBox(width: 10),
          ),
          Text(
            ' \$${expenseModel.amount.toString()}',
            style: AppTextStyles.poppins16Blue,
          ),
        ],
      ),
    );
  }
}
