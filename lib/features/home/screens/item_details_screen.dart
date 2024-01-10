import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../store/home_store.dart';
import '../widgets/icon_widget.dart';
import 'edit_expense_details.dart';

// ignore: must_be_immutable
class ItemDetailsScreen extends StatelessWidget {
  ItemDetailsScreen({
    required this.isExpense,
    required this.index,
    Key? key,
  }) : super(key: key);

  int index;
  bool isExpense;

  @override
  Widget build(BuildContext context) {
    final store = context.read<HomeStore>();

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBarWidget(
        title: isExpense ? 'Expense Details' : 'Expected Payment Details',
        actionName: 'Edit',
        action: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Provider.value(
                  value: store,
                  child: EditExpenseScreen(
                    model: isExpense
                        ? store.expenseItems[index]
                        : store.expectedPaymentItems[index],
                    screenName: isExpense ? 'expense' : 'expected payments',
                  ))));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0C04060F),
                      blurRadius: 60,
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    if (isExpense)
                      IconWidget(icon: store.expenseItems[index].icon),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Name', style: AppTextStyles.poppins14Grey),
                        Text(
                          isExpense
                              ? store.expenseItems[index].itemName
                              : store.expectedPaymentItems[index].itemName,
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(isExpense ? 'Amount' : 'Saving Amount',
                            style: AppTextStyles.poppins14Grey),
                        Text(
                          isExpense
                              ? "\$${store.expenseItems[index].amount}"
                              : "\$${store.expectedPaymentItems[index].amount}",
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Date', style: AppTextStyles.poppins14Grey),
                        Text(
                          isExpense
                              ? store.expenseItems[index].date
                              : store.expectedPaymentItems[index].date,
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Reminder',
                            style: AppTextStyles.poppins14Grey),
                        Text(
                          isExpense
                              ? store.expenseItems[index].period
                              : store.expectedPaymentItems[index].period,
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Category',
                            style: AppTextStyles.poppins14Grey),
                        Text(
                          isExpense
                              ? store.expenseItems[index].itemName
                              : store.expectedPaymentItems[index].itemName,
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Status',
                            style: AppTextStyles.poppins14Grey),
                        Observer(
                          builder: (context) => OutlinedButton(
                            style: ButtonStyle(
                                minimumSize: const MaterialStatePropertyAll(
                                    Size(150, 33)),
                                backgroundColor: MaterialStatePropertyAll(
                                    store.expenseItems[index].status
                                        ? AppColors.blue
                                        : Colors.white),
                                side: MaterialStatePropertyAll(BorderSide(
                                    color: store.expenseItems[index].status
                                        ? Colors.transparent
                                        : AppColors.blue))),
                            onPressed: () =>
                                store.setStatus(store.expenseItems[index]),
                            child: Text(
                              store.expenseItems[index].status
                                  ? 'Paid'
                                  : 'Mark as Paid',
                              style: store.expenseItems[index].status
                                  ? AppTextStyles.poppins20Whitebold
                                  : AppTextStyles.poppins16Blue,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Notes', style: AppTextStyles.poppins14Grey)),
                    if ((isExpense == true &&
                            store.expenseItems[index].notes != null) ||
                        (isExpense == false &&
                            store.expectedPaymentItems[index].notes != null))
                      Text(
                        isExpense
                            ? store.expenseItems[index].notes!
                            : store.expectedPaymentItems[index].notes!,
                        style: AppTextStyles.poppins16Blue
                            .copyWith(color: Colors.black),
                      ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            AppColors.red.withOpacity(0.2))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          actionsAlignment: MainAxisAlignment.center,
                          title: Text(
                              isExpense
                                  ? 'Are you sure you want to delete this earnings?'
                                  : 'Are you sure you want to delete this savings?',
                              style: AppTextStyles.poppins16Blue
                                  .copyWith(color: Colors.black),
                              textAlign: TextAlign.center),
                          actions: [
                            OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel',
                                    style: AppTextStyles.poppins14Black)),
                            OutlinedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColors.red)),
                                onPressed: () {
                                  isExpense
                                      ? store.deleteExpense(
                                          store.expenseItems[index])
                                      : store.deleteExpense(
                                          store.expectedPaymentItems[index]);

                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Delete',
                                  style: AppTextStyles.poppins10White
                                      .copyWith(fontSize: 14),
                                )),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'Delete',
                      style: AppTextStyles.poppins14Red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
