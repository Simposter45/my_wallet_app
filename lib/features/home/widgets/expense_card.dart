import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../model/expenses_model.dart';
import '../screens/edit_expense_details.dart';
import '../store/home_store.dart';
import 'icon_widget.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    required this.store,
    required this.expenseModel,
    Key? key,
  }) : super(key: key);

  final HomeStore store;
  final ExpenseModel expenseModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                IconWidget(icon: expenseModel.icon),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          expenseModel.itemName,
                          style: AppTextStyles.poppins16Blue
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: expenseModel.paymentType == 'Debit'
                                ? AppColors.debitColorBackground
                                : AppColors.creditColorBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            child: Text(expenseModel.paymentType,
                                style: AppTextStyles.poppins10White.copyWith(
                                  color: expenseModel.paymentType == 'Debit'
                                      ? AppColors.debitColorText
                                      : AppColors.creditColorText,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      expenseModel.period,
                      style: AppTextStyles.poppins14Grey2,
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(expenseModel.amount.toString(),
                      style: AppTextStyles.poppins16Blue),
                ),
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Provider.value(
                    value: store,
                    child: EditExpenseScreen(
                      screenName: 'Expense',
                      model: expenseModel,
                    )))),
            icon: SvgPicture.asset('assets/svg/edit.svg')),
      ],
    );
  }
}
