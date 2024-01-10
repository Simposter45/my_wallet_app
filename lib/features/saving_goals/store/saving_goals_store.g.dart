// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_goals_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SavingGoalsStore on _SavingGoalsStore, Store {
  late final _$savingGoalsListAtom =
      Atom(name: '_SavingGoalsStore.savingGoalsList', context: context);

  @override
  ObservableList<SavingGoalsModel> get savingGoalsList {
    _$savingGoalsListAtom.reportRead();
    return super.savingGoalsList;
  }

  @override
  set savingGoalsList(ObservableList<SavingGoalsModel> value) {
    _$savingGoalsListAtom.reportWrite(value, super.savingGoalsList, () {
      super.savingGoalsList = value;
    });
  }

  late final _$itemNameAtom =
      Atom(name: '_SavingGoalsStore.itemName', context: context);

  @override
  String get itemName {
    _$itemNameAtom.reportRead();
    return super.itemName;
  }

  @override
  set itemName(String value) {
    _$itemNameAtom.reportWrite(value, super.itemName, () {
      super.itemName = value;
    });
  }

  late final _$amountToSaveAtom =
      Atom(name: '_SavingGoalsStore.amountToSave', context: context);

  @override
  double get amountToSave {
    _$amountToSaveAtom.reportRead();
    return super.amountToSave;
  }

  @override
  set amountToSave(double value) {
    _$amountToSaveAtom.reportWrite(value, super.amountToSave, () {
      super.amountToSave = value;
    });
  }

  late final _$yourContributionAtom =
      Atom(name: '_SavingGoalsStore.yourContribution', context: context);

  @override
  double get yourContribution {
    _$yourContributionAtom.reportRead();
    return super.yourContribution;
  }

  @override
  set yourContribution(double value) {
    _$yourContributionAtom.reportWrite(value, super.yourContribution, () {
      super.yourContribution = value;
    });
  }

  late final _$selectedPeriodAtom =
      Atom(name: '_SavingGoalsStore.selectedPeriod', context: context);

  @override
  String get selectedPeriod {
    _$selectedPeriodAtom.reportRead();
    return super.selectedPeriod;
  }

  @override
  set selectedPeriod(String value) {
    _$selectedPeriodAtom.reportWrite(value, super.selectedPeriod, () {
      super.selectedPeriod = value;
    });
  }

  late final _$isPageOpenAtom =
      Atom(name: '_SavingGoalsStore.isPageOpen', context: context);

  @override
  bool get isPageOpen {
    _$isPageOpenAtom.reportRead();
    return super.isPageOpen;
  }

  @override
  set isPageOpen(bool value) {
    _$isPageOpenAtom.reportWrite(value, super.isPageOpen, () {
      super.isPageOpen = value;
    });
  }

  late final _$_SavingGoalsStoreActionController =
      ActionController(name: '_SavingGoalsStore', context: context);

  @override
  void setItemName(String name) {
    final _$actionInfo = _$_SavingGoalsStoreActionController.startAction(
        name: '_SavingGoalsStore.setItemName');
    try {
      return super.setItemName(name);
    } finally {
      _$_SavingGoalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmountToSave(double value) {
    final _$actionInfo = _$_SavingGoalsStoreActionController.startAction(
        name: '_SavingGoalsStore.setAmountToSave');
    try {
      return super.setAmountToSave(value);
    } finally {
      _$_SavingGoalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYourContribution(double value) {
    final _$actionInfo = _$_SavingGoalsStoreActionController.startAction(
        name: '_SavingGoalsStore.setYourContribution');
    try {
      return super.setYourContribution(value);
    } finally {
      _$_SavingGoalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedPeriod(String period) {
    final _$actionInfo = _$_SavingGoalsStoreActionController.startAction(
        name: '_SavingGoalsStore.setSelectedPeriod');
    try {
      return super.setSelectedPeriod(period);
    } finally {
      _$_SavingGoalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(
      String itemName, double amount, double contribution, String period) {
    final _$actionInfo = _$_SavingGoalsStoreActionController.startAction(
        name: '_SavingGoalsStore.addItem');
    try {
      return super.addItem(itemName, amount, contribution, period);
    } finally {
      _$_SavingGoalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem(SavingGoalsModel savingGoalsModel) {
    final _$actionInfo = _$_SavingGoalsStoreActionController.startAction(
        name: '_SavingGoalsStore.deleteItem');
    try {
      return super.deleteItem(savingGoalsModel);
    } finally {
      _$_SavingGoalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageOpen(bool value) {
    final _$actionInfo = _$_SavingGoalsStoreActionController.startAction(
        name: '_SavingGoalsStore.setPageOpen');
    try {
      return super.setPageOpen(value);
    } finally {
      _$_SavingGoalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
savingGoalsList: ${savingGoalsList},
itemName: ${itemName},
amountToSave: ${amountToSave},
yourContribution: ${yourContribution},
selectedPeriod: ${selectedPeriod},
isPageOpen: ${isPageOpen}
    ''';
  }
}
