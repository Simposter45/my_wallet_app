import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/lists.dart';

import '../store/home_store.dart';
import '../widgets/icon_widget.dart';

// ignore: must_be_immutable
class ExpenseFullScreen extends StatelessWidget {
  ExpenseFullScreen({Key? key}) : super(key: key);

  double amount = 0;
  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<HomeStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: DropdownMenu(
                        leadingIcon:
                            const Icon(Icons.keyboard_arrow_down_rounded),
                        trailingIcon: const SizedBox(),
                        hintText: currencyList.first,
                        initialSelection: currencyList.first,
                        inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_fullscreen_rounded))
                ],
              ),
              const SizedBox(height: 13),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                style: AppTextStyles.poppins30Blackbold.copyWith(fontSize: 35),
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
                              color: expenseStore.paymentType == 'Debit'
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
                                color: expenseStore.paymentType == 'Credit'
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
                  style:
                      AppTextStyles.poppins20Blackbold.copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < iconsList.length; i++) ...[
                    Column(
                      children: [
                        Observer(builder: (context) {
                          final icon1 = iconsList[i];
                          final iconName = iconsMap[icon1];

                          return GestureDetector(
                              onTap: () {
                                expenseStore.setSelectedCategoryIcon(icon1);
                              },
                              child: Column(
                                children: [
                                  DecoratedBox(
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
                                      child: IconWidget(icon: icon1)),
                                  const SizedBox(height: 7),
                                  Text(iconName!),
                                ],
                              ));
                        }),
                      ],
                    )
                  ]
                ],
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Period',
                  style:
                      AppTextStyles.poppins20Blackbold.copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < periodsList.length; i++) ...[
                    Observer(builder: (context) {
                      final period = periodsList[i];

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.lightBlue,
                          border: Border.all(
                            color: expenseStore.selectedPeriod == period
                                ? Colors.blue
                                : Colors.transparent,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
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
                      );
                    })
                  ],
                ],
              ),
              const SizedBox(height: 30),

              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderGrey)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.attachment_rounded,
                        color: AppColors.borderGrey,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Add Attachment',
                        style: AppTextStyles.poppins16Blue
                            .copyWith(color: AppColors.borderGrey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Notes',
                  style:
                      AppTextStyles.poppins20Blackbold.copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                maxLines: null,
                autofocus: true,
                style: AppTextStyles.poppins14Black,
                onChanged: (val) {},
                decoration: InputDecoration(
                  fillColor: AppColors.lightGrey,
                  filled: true,
                  hintText: 'Write your notes...',
                  hintStyle: AppTextStyles.poppins14Grey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),

              // MainButton(
              //     action: () {
              //       if (amount != 0) {
              //         expenseStore
              //           ..setAmount(amount)
              //           ..addItem(
              //             iconsMap[expenseStore.selectedCategoryIcon]!,
              //             expenseStore.amount,
              //             expenseStore.selectedCategoryIcon,
              //             expenseStore.selectedPeriod,
              //             expenseStore.paymentType,
              //           );
              //       }
              //     },
              //     buttonName: 'Add'),
            ],
          ),
        ),
      ),
    );
  }
}
