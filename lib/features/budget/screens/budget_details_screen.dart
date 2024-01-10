import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../store/budget_store.dart';
import 'edit_earnings_details.dart';

// ignore: must_be_immutable
class BudgetDetailsScreen extends StatelessWidget {
  BudgetDetailsScreen({
    required this.isEarning,
    required this.index,
    Key? key,
  }) : super(key: key);

  int index;
  bool isEarning;

  @override
  Widget build(BuildContext context) {
    final store = context.read<BudgetStore>();

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBarWidget(
        title: isEarning ? 'Earning Details' : 'Saving Details',
        actionName: 'Edit',
        action: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => Provider.value(
                  value: store,
                  child: EditEarningsScreen(
                    screenName: isEarning ? 'Earning' : 'Saving',
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
                    if (isEarning)
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: store.earningsList[index].color
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: Text(
                            store.earningsList[index].name.substring(0, 1),
                            style: AppTextStyles.poppins20Black,
                          ),
                        ),
                      ),
                    if (isEarning) const SizedBox(height: 30),
                    if (isEarning) const Divider(),
                    if (isEarning) const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Name', style: AppTextStyles.poppins14Grey),
                        Text(
                          isEarning
                              ? store.earningsList[index].name
                              : store.savingsList[index].name,
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    if (isEarning == false)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Amount',
                              style: AppTextStyles.poppins14Grey),
                          Text(
                            isEarning == false
                                ? "\$${store.savingsList[index].totalAmount}"
                                : "",
                            style: AppTextStyles.poppins16Blue
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(isEarning ? 'Amount' : 'Saving Amount',
                            style: AppTextStyles.poppins14Grey),
                        Text(
                          isEarning
                              ? "\$${store.earningsList[index].amount}"
                              : "\$${store.savingsList[index].savingAmount}",
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Due Date',
                            style: AppTextStyles.poppins14Grey),
                        Text(
                          isEarning
                              ? store.earningsList[index].dueDate
                              : store.savingsList[index].dueDate,
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Reoccurance',
                            style: AppTextStyles.poppins14Grey),
                        Text(
                          isEarning
                              ? store.earningsList[index].period
                              : store.savingsList[index].period,
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Notes', style: AppTextStyles.poppins14Grey)),
                    if ((isEarning == true &&
                            store.earningsList[index].notes != null) ||
                        (isEarning == false &&
                            store.savingsList[index].notes != null))
                      Text(
                        isEarning
                            ? store.earningsList[index].notes!
                            : store.savingsList[index].notes!,
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
                              isEarning
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
                                  isEarning
                                      ? store.deleteEarning(
                                          store.earningsList[index])
                                      : store.deleteSaving(
                                          store.savingsList[index]);

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
