import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/lists.dart';
import '../../_global/widgets/app_bar_widget.dart';

import '../model/expenses_model.dart';
import '../store/home_store.dart';
import '../widgets/icon_widget.dart';

class EditExpenseScreen extends StatelessWidget {
  EditExpenseScreen({
    required this.screenName,
    required this.model,
    Key? key,
  }) : super(key: key);

  final String screenName;
  final ExpenseModel model;

  String name = '';
  double amount = 0;
  String date = '';

  @override
  Widget build(BuildContext context) {
    final store = context.read<HomeStore>();
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBarWidget(
        title: 'Edit $screenName detail',
        action: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actionsAlignment: MainAxisAlignment.center,
              title: Text(
                  'You have unsaved changes. Would you like to save them?',
                  style:
                      AppTextStyles.poppins16Blue.copyWith(color: Colors.black),
                  textAlign: TextAlign.center),
              actions: [
                OutlinedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.red)),
                    onPressed: () => Navigator.pop(context),
                    child: Text('Discard',
                        style: AppTextStyles.poppins10White
                            .copyWith(fontSize: 14))),
                OutlinedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.green)),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style:
                          AppTextStyles.poppins10White.copyWith(fontSize: 14),
                    )),
              ],
            ),
          );
        },
        actionName: 'Save',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bill Name',
                style: AppTextStyles.poppins14Black,
              ),
              const SizedBox(height: 6),
              TextField(
                autofocus: true,
                controller: TextEditingController(text: model.itemName),
                style: AppTextStyles.poppins14Black,
                onChanged: (value) => name = value,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Amount',
                style: AppTextStyles.poppins14Black,
              ),
              const SizedBox(height: 6),
              TextField(
                autofocus: true,
                style: AppTextStyles.poppins14Black,
                keyboardType: TextInputType.number,
                controller:
                    TextEditingController(text: model.amount.toString()),
                onChanged: (value) => amount = double.parse(value),
                decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(maxWidth: 100),
                  prefixIcon: DropdownMenu(
                    trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                    hintText: currencyList.first,
                    initialSelection: currencyList.first,
                    inputDecorationTheme: InputDecorationTheme(
                      constraints:
                          const BoxConstraints(maxWidth: 100, maxHeight: 50),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    dropdownMenuEntries:
                        currencyList.map<DropdownMenuEntry<String>>((value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                  hintText: 'Enter Amount',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Due Date',
                style: AppTextStyles.poppins14Black,
              ),
              const SizedBox(height: 6),
              TextField(
                autofocus: true,
                style: AppTextStyles.poppins14Black,
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: model.date),
                onChanged: (value) => date = value,
                decoration: InputDecoration(
                  suffixIconConstraints: const BoxConstraints(maxWidth: 100),
                  suffixIcon: IconButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now());
                      },
                      icon: const Icon(Icons.calendar_month_rounded)),
                  hintText: 'Enter Amount',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (val) {},
                    checkColor: AppColors.blue,
                    side: const BorderSide(color: AppColors.blue),
                    fillColor: const MaterialStatePropertyAll(Colors.white),
                  ),
                  Text(
                    'Every Month',
                    style: AppTextStyles.poppins14Black.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ExpenseDetailDropdownWidget(
                title: 'Choose Category',
                list: categoryList,
              ),
              const SizedBox(height: 20),
              ExpenseDetailDropdownWidget(
                title: 'Bank',
                list: banksList,
              ),
              const SizedBox(height: 20),
              ExpenseDetailDropdownWidget(
                title: 'Status',
                list: statusList,
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose Style',
                style: AppTextStyles.poppins14Black,
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 15,
                runSpacing: 10,
                children: [
                  for (int i = 0; i < iconsList.length; i++) ...[
                    Observer(builder: (context) {
                      final icon = iconsList[i];
                      return GestureDetector(
                          onTap: () {
                            store.setSelectedCategoryIcon(icon);
                          },
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color:
                                        store.selectedCategoryIcon == iconsMap
                                            ? Colors.blue
                                            : Colors.transparent,
                                  )),
                              child: IconWidget(icon: icon)));
                    }),
                  ]
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Notes',
                style: AppTextStyles.poppins14Black,
              ),
              const SizedBox(height: 6),
              TextField(
                maxLines: null,
                style: AppTextStyles.poppins14Black,
                onChanged: (val) {},
                decoration: InputDecoration(
                  fillColor: AppColors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseDetailDropdownWidget extends StatelessWidget {
  ExpenseDetailDropdownWidget({
    required this.title,
    required this.list,
    Key? key,
  }) : super(key: key);

  String title;
  List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.poppins14Black,
        ),
        const SizedBox(height: 6),
        DropdownMenu(
          trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
          hintText: list.first,
          initialSelection: list.first,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            constraints: const BoxConstraints(minWidth: 300),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ],
    );
  }
}
