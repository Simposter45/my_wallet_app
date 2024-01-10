import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../store/budget_store.dart';
import 'budget_details_screen.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final savingStore = context.read<BudgetStore>();
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBarWidget(title: 'Savings'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Observer(
          builder: (context) => ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: savingStore.savingsList.length,
              itemBuilder: (context, index) {
                final savingsItem = savingStore.savingsList[index];
                final percentSaved =
                    (savingsItem.savingAmount / savingsItem.totalAmount) * 100;
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          savingsItem.name,
                          style: AppTextStyles.poppins20Blackbold,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Balance',
                              style: AppTextStyles.poppins14Black,
                            ),
                            Text(
                              "${percentSaved.ceil()}%",
                              style: AppTextStyles.poppins14Black,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          children: [
                            Container(
                              height: 10,
                              decoration: BoxDecoration(
                                  color: AppColors.borderGrey,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Container(
                              width: (savingsItem.savingAmount /
                                      savingsItem.totalAmount) *
                                  100,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: savingsItem.color,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "\$${savingsItem.savingAmount}",
                                    style: AppTextStyles.poppins20Blackbold),
                                TextSpan(
                                    text: " of \$${savingsItem.totalAmount}",
                                    style: AppTextStyles.poppins14Black),
                              ]),
                            ),
                            const Text(
                              'Some Days left',
                              style: AppTextStyles.poppins14Black,
                            ),
                          ],
                        ),
                        TextButton(
                            style: const ButtonStyle(
                                padding:
                                    MaterialStatePropertyAll(EdgeInsets.zero)),
                            onPressed: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Provider.value(
                                          value: savingStore,
                                          child: BudgetDetailsScreen(
                                            index: index,
                                            isEarning: false,
                                          ),
                                        ))),
                            child: Text('See Details',
                                style: AppTextStyles.poppins14Black
                                    .copyWith(fontWeight: FontWeight.w600))),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
