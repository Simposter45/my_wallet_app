import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/styles.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../store/budget_store.dart';
import 'budget_details_screen.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final earningStore = context.read<BudgetStore>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Earnings'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Observer(
          builder: (context) => ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: earningStore.earningsList.length,
              itemBuilder: (context, index) {
                final earningItem = earningStore.earningsList[index];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: earningItem.color.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              earningItem.name.substring(0, 1),
                              style: AppTextStyles.poppins20Blackbold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            earningItem.name,
                            style: AppTextStyles.poppins20Blackbold,
                          )
                        ]),
                        const SizedBox(height: 20),
                        const Text(
                          'Balance',
                          style: AppTextStyles.poppins14Black,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$${earningItem.amount}",
                                style: AppTextStyles.poppins20Blackbold),
                            TextButton(
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) => Provider.value(
                                              value: earningStore,
                                              child: BudgetDetailsScreen(
                                                index: index,
                                                isEarning: true,
                                              ),
                                            ))),
                                child: const Text('See Details',
                                    style: AppTextStyles.poppins14Black)),
                          ],
                        ),
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
