import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/lists.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../../login/widgets/main_button.dart';
import '../store/home_store.dart';
import '../widgets/expense_card.dart';
import '../widgets/icon_widget.dart';
import 'add_expense_full_screen.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<HomeStore>(context);

    double amount = 0;

    return Scaffold(
      appBar: AppBarWidget(
          title: 'Pay and Receive',
          actionName: 'Done',
          action: () => Navigator.of(context).pop()),
      backgroundColor: AppColors.appBackgroundColor,
      body: SingleChildScrollView(child: Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Hero(
                tag: 'contentTag',
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: DropdownMenu(
                                  leadingIcon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  trailingIcon: const SizedBox(),
                                  hintText: currencyList.first,
                                  initialSelection: currencyList.first,
                                  inputDecorationTheme: InputDecorationTheme(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                  dropdownMenuEntries: currencyList
                                      .map<DropdownMenuEntry<String>>((value) {
                                    return DropdownMenuEntry<String>(
                                        value: value, label: value);
                                  }).toList(),
                                ),
                              ),
                            ),
                            IconButton(
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  expenseStore.setPageOpen(true);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Provider.value(
                                          value: expenseStore,
                                          child: ExpenseFullScreen()),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.open_in_full_rounded))
                          ],
                        ),
                        const SizedBox(height: 13),
                        TextField(
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          style: AppTextStyles.poppins30Blackbold
                              .copyWith(fontSize: 35),
                          onChanged: (value) => amount = double.parse(value),
                          decoration: const InputDecoration(
                            constraints: BoxConstraints(maxWidth: 120),
                            prefixIcon: Text(
                              r"$",
                              style: AppTextStyles.poppins30Blackbold,
                            ),
                            hintText: '0',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        Observer(
                          builder: (context) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 40,
                                child: OutlinedButton(
                                  onPressed: () {
                                    expenseStore.setPaymentType('Debit');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      expenseStore.paymentType == 'Debit'
                                          ? AppColors.lightBlue
                                          : Colors.transparent,
                                    ),
                                    side: MaterialStatePropertyAll(
                                      BorderSide(
                                        color:
                                            expenseStore.paymentType == 'Debit'
                                                ? AppColors.blue
                                                : AppColors.borderGrey,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Debit',
                                    style: expenseStore.paymentType == 'Debit'
                                        ? AppTextStyles.poppins14Blue
                                        : AppTextStyles.poppins14Grey2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: 100,
                                height: 40,
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        expenseStore.paymentType == 'Credit'
                                            ? AppColors.lightBlue
                                            : Colors.transparent,
                                      ),
                                      side: MaterialStatePropertyAll(
                                        BorderSide(
                                          color: expenseStore.paymentType ==
                                                  'Credit'
                                              ? AppColors.blue
                                              : AppColors.borderGrey,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      expenseStore.setPaymentType('Credit');
                                    },
                                    child: const Text(
                                      'Credit',
                                      style: AppTextStyles.poppins14Grey2,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Category',
                            style: AppTextStyles.poppins20Blackbold
                                .copyWith(fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 130,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemCount: iconsList.length ~/ 2,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final icon1 = iconsList[index];
                              final icon2 =
                                  iconsList[iconsList.length ~/ 2 + index];
                              return Column(
                                children: [
                                  Observer(
                                    builder: (context) => GestureDetector(
                                        onTap: () {
                                          expenseStore
                                              .setSelectedCategoryIcon(icon1);
                                        },
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: expenseStore
                                                              .selectedCategoryIcon ==
                                                          icon1
                                                      ? Colors.blue
                                                      : Colors.transparent,
                                                )),
                                            child: IconWidget(icon: icon1))),
                                  ),
                                  const SizedBox(height: 8),
                                  Observer(
                                    builder: (context) => GestureDetector(
                                        onTap: () {
                                          expenseStore
                                              .setSelectedCategoryIcon(icon2);
                                        },
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: expenseStore
                                                              .selectedCategoryIcon ==
                                                          icon2
                                                      ? Colors.blue
                                                      : Colors.transparent,
                                                )),
                                            child: IconWidget(icon: icon2))),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 7),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Period',
                            style: AppTextStyles.poppins20Blackbold
                                .copyWith(fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 60,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: periodsList.length,
                            itemBuilder: (context, index) {
                              final period = periodsList[index];

                              return Observer(
                                builder: (context) => DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.lightBlue,
                                    border: Border.all(
                                      color:
                                          expenseStore.selectedPeriod == period
                                              ? Colors.blue
                                              : Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: TextButton(
                                      onPressed: () {
                                        expenseStore.setSelectedPeriod(period);
                                      },
                                      child: Text(
                                        period,
                                        style: AppTextStyles.poppins16Blue
                                            .copyWith(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                          ),
                        ),
                        const SizedBox(height: 40),
                        MainButton(
                            action: () {
                              if (amount != 0 &&
                                  (expenseStore.paymentType == 'Debit' ||
                                      expenseStore.paymentType == 'Credit')) {
                                expenseStore
                                  ..setAmount(amount)
                                  ..addItem(
                                    iconsMap[
                                        expenseStore.selectedCategoryIcon]!,
                                    expenseStore.amount,
                                    expenseStore.selectedCategoryIcon,
                                    expenseStore.selectedPeriod,
                                    expenseStore.paymentType,
                                  );
                              }
                            },
                            buttonName: 'Add'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Observer(
                builder: (context) => ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: expenseStore.expenseItems.length,
                  itemBuilder: (context, index) {
                    final expenseModel = expenseStore.expenseItems[index];

                    return ExpenseCard(
                      store: expenseStore,
                      expenseModel: expenseModel,
                    );
                  },
                ),
              )
            ],
          ),
        );
      })),
    );
  }
}
