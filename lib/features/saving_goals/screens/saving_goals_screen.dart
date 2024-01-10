import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/lists.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../../login/widgets/main_button.dart';
import '../model/saving_goals_model.dart';
import '../store/saving_goals_store.dart';
import '../widgets/saving_goals_card.dart';

class SavingGoalsScreen extends StatelessWidget {
  SavingGoalsScreen({Key? key}) : super(key: key);

  String itemName = '';
  double amountToSave = 0;
  double yourContribution = 0;

  @override
  Widget build(BuildContext context) {
    final store = context.read<SavingGoalsStore>();
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBarWidget(
          title: 'Saving Goals Screen',
          actionName: 'Done',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                DecoratedBox(
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
                                  trailingIcon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
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
                                  // expenseStore.setPageOpen(true);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Provider.value(
                                  //         value: expenseStore,
                                  //         child: ExpenseFullScreen()),
                                  //   ),
                                  // );
                                },
                                icon: const Icon(Icons.open_in_full_rounded))
                          ],
                        ),
                        // item Name field
                        TextField(
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          style: AppTextStyles.poppins30Blackbold
                              .copyWith(fontSize: 35),
                          onChanged: (value) => itemName = value,
                          decoration: const InputDecoration(
                            constraints: BoxConstraints(maxWidth: 160),
                            hintText: 'Untitled',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        _SavingGoalsSection(
                          heading: 'Amount to Save',
                          onChanged: (value) {
                            amountToSave = value;
                            store.setAmountToSave(amountToSave);
                          },
                        ),
                        const SizedBox(height: 15),
                        _SavingGoalsSection(
                          heading: 'Your Contribution',
                          onChanged: (value) {
                            yourContribution = value;
                            store.setYourContribution(yourContribution);
                          },
                        ),
                        const SizedBox(height: 15),
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
                                      color: store.selectedPeriod == period
                                          ? Colors.blue
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: TextButton(
                                      onPressed: () {
                                        store.setSelectedPeriod(period);
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
                        const SizedBox(height: 15),
                        MainButton(
                            action: () {
                              if (itemName != '') {
                                store
                                  ..setItemName(itemName)
                                  // ..setAmountToSave(amountToSave)
                                  // ..setYourContribution(yourContribution)
                                  ..addItem(
                                      store.itemName,
                                      store.amountToSave,
                                      store.yourContribution,
                                      store.selectedPeriod);
                              }
                            },
                            buttonName: 'Add')
                      ],
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
                    itemCount: store.savingGoalsList.length,
                    itemBuilder: (context, index) {
                      final savingGoalsModel = store.savingGoalsList[index];

                      return SavingGoalsCard(
                          store: store, savingGoalsModel: savingGoalsModel);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _SavingGoalsSection extends StatelessWidget {
  _SavingGoalsSection({
    required this.heading,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final String heading;

  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    // final store = context.read<SavingGoalsStore>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: AppTextStyles.poppins14Grey),
        TextField(
          autofocus: true,
          keyboardType: TextInputType.number,
          style: AppTextStyles.poppins30Blackbold.copyWith(fontSize: 35),
          onChanged: (value) {
            final parsedValue = double.parse(value);
            onChanged(parsedValue);
          },
          decoration: const InputDecoration(
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
      ],
    );
  }
}
