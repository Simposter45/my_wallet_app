import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/constants/colors.dart';
import '../model/earnings_model.dart';
import '../model/savings_model.dart';

part 'budget_store.g.dart';

class BudgetStore = _BudgetStore with _$BudgetStore;

abstract class _BudgetStore with Store {
  @observable
  ObservableList<EarningsModel> earningsList = ObservableList.of(earningList);
  ObservableList<SavingsModel> savingsList = ObservableList.of(savingList);

  List<String> budgetList = ['Earnings', 'Savings'];
  List<String> currencyList = ['USD', 'INR'];
  List<Color> colorsist = [
    AppColors.earningColor1,
    AppColors.earningColor2,
    AppColors.earningColor3,
    AppColors.earningColor4,
    AppColors.earningColor5,
  ];

  @action
  void addEarning(EarningsModel earning) {
    earningsList.add(earning);
  }

  @action
  void deleteEarning(EarningsModel earningsModel) {
    earningsList.remove(earningsModel);
  }

  @action
  void editEarning(int index, EarningsModel updatedEarnings) {
    earningsList[index] = updatedEarnings;
  }

  @action
  void addSaving(SavingsModel saving) {
    savingsList.add(saving);
  }

  @action
  void deleteSaving(SavingsModel savingsModel) {
    savingsList.remove(savingsModel);
  }

  @action
  void editSaving(int index, SavingsModel updatedSaving) {
    savingsList[index] = updatedSaving;
  }
}
