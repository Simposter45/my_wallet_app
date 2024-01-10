import 'package:mobx/mobx.dart';

import '../model/saving_goals_model.dart';

part 'saving_goals_store.g.dart';

class SavingGoalsStore = _SavingGoalsStore with _$SavingGoalsStore;

abstract class _SavingGoalsStore with Store {
  @observable
  ObservableList<SavingGoalsModel> savingGoalsList =
      ObservableList<SavingGoalsModel>();

  @observable
  String itemName = '';

  @observable
  double amountToSave = 0;

  @observable
  double yourContribution = 0;

  @observable
  String selectedPeriod = '1 week';

  @observable
  bool isPageOpen = false;

  @action
  void setItemName(String name) {
    itemName = name;
  }

  @action
  void setAmountToSave(double value) {
    amountToSave = value;
  }

  @action
  void setYourContribution(double value) {
    amountToSave = value;
  }

  @action
  void setSelectedPeriod(String period) {
    selectedPeriod = period;
  }

  @action
  void addItem(
      String itemName, double amount, double contribution, String period) {
    final item = SavingGoalsModel(
      itemName: itemName,
      amounttoSave: amount,
      period: period,
      yourContribution: contribution,
      date: 'June 25, 2023',
    );
    savingGoalsList.add(item);
  }

  @action
  void deleteItem(SavingGoalsModel savingGoalsModel) {
    savingGoalsList.remove(savingGoalsModel);
  }

  @action
  void setPageOpen(bool value) {
    isPageOpen = value;
  }
}
