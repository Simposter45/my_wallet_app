import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../store/home_store.dart';
import '../widgets/home_section.dart';
import 'add_expense.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<HomeStore>();

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.borderGrey,
                      backgroundImage:
                          AssetImage('assets/png/profile_picture.png'),
                    ),
                    IconButton(
                        onPressed: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => Provider.value(
                                    value: store,
                                    child: const NotificationScreen()))),
                        icon: const Icon(Icons.notifications_none_rounded))
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Net Worth', style: AppTextStyles.poppins14Grey),
                const SizedBox(height: 7),
                Text(r"$9400",
                    style: AppTextStyles.poppins30Blackbold
                        .copyWith(fontSize: 40)),
                const SizedBox(height: 10),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.arrow_downward_rounded,
                          size: 50,
                          color: AppColors.green,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Income',
                              style: AppTextStyles.poppins14Black,
                            ),
                            Text(
                              r'$2500',
                              style: AppTextStyles.poppins20Blackbold,
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: AppColors.borderGrey,
                        ),
                        Icon(
                          Icons.arrow_upward_rounded,
                          size: 50,
                          color: AppColors.red,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expenses',
                              style: AppTextStyles.poppins14Black,
                            ),
                            Text(
                              r'$900',
                              style: AppTextStyles.poppins20Blackbold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const HomeSection(
                  emptytext: "You don't have any expenses",
                  header: 'Expenses',
                  imageName: 'no_expenses',
                  dialogContent:
                      'To create an expenses, provide bill details like amount, due date, and other info. Choose recurring or one-time payment for convenience.',
                ),
                const SizedBox(height: 20),
                const HomeSection(
                  emptytext: "You don't have any expected payments",
                  header: 'Expected Payments',
                  imageName: 'no_expected_payments',
                  dialogContent:
                      'To add an expected payment, provide amount, due date, and payee details. Choose recurring or one-time payment for convenience.',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Provider.value(value: store, child: const AddExpense()))),
        elevation: 10,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
