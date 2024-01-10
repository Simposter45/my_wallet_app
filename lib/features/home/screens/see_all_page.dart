import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../_global/widgets/app_bar_widget.dart';
import '../store/home_store.dart';
import '../widgets/expense_list_widget.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({
    required this.pageTitle,
    Key? key,
  }) : super(key: key);

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    final expenseStore = context.read<HomeStore>();
    return Scaffold(
      appBar: AppBarWidget(
        title: pageTitle,
        action: () {},
        actionName: 'Add',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Observer(
          builder: (context) => ListView.separated(
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
                  expenseStore: expenseStore,
                  index: index,
                );
              }),
        ),
      ),
    );
  }
}
