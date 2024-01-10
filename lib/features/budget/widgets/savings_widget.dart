import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../model/savings_model.dart';
import '../screens/budget_details_screen.dart';
import '../store/budget_store.dart';

class SavingsWidget extends StatelessWidget {
  const SavingsWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final savingsStore = context.read<BudgetStore>();
    final savingsItem = savingsStore.savingsList[index];
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    savingsItem.name,
                    style: AppTextStyles.poppins14Grey,
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Provider.value(
                          value: savingsStore,
                          child: BudgetDetailsScreen(
                              isEarning: false, index: index)),
                    )),
                    icon: const Icon(Icons.chevron_right_rounded),
                  )
                ],
              ),
              Text(
                "\$ ${savingsItem.totalAmount}",
                style: AppTextStyles.poppins20Black,
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColors.borderGrey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    width:
                        (savingsItem.savingAmount / savingsItem.totalAmount) *
                            100,
                    height: 10,
                    decoration: BoxDecoration(
                        color: savingsItem.color,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
