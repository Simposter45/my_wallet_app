// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BudgetStore on _BudgetStore, Store {
  late final _$earningsListAtom =
      Atom(name: '_BudgetStore.earningsList', context: context);

  @override
  ObservableList<EarningsModel> get earningsList {
    _$earningsListAtom.reportRead();
    return super.earningsList;
  }

  @override
  set earningsList(ObservableList<EarningsModel> value) {
    _$earningsListAtom.reportWrite(value, super.earningsList, () {
      super.earningsList = value;
    });
  }

  late final _$_BudgetStoreActionController =
      ActionController(name: '_BudgetStore', context: context);

  @override
  void addEarning(EarningsModel earning) {
    final _$actionInfo = _$_BudgetStoreActionController.startAction(
        name: '_BudgetStore.addEarning');
    try {
      return super.addEarning(earning);
    } finally {
      _$_BudgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteEarning(EarningsModel earningsModel) {
    final _$actionInfo = _$_BudgetStoreActionController.startAction(
        name: '_BudgetStore.deleteEarning');
    try {
      return super.deleteEarning(earningsModel);
    } finally {
      _$_BudgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editEarning(int index, EarningsModel updatedEarnings) {
    final _$actionInfo = _$_BudgetStoreActionController.startAction(
        name: '_BudgetStore.editEarning');
    try {
      return super.editEarning(index, updatedEarnings);
    } finally {
      _$_BudgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSaving(SavingsModel saving) {
    final _$actionInfo = _$_BudgetStoreActionController.startAction(
        name: '_BudgetStore.addSaving');
    try {
      return super.addSaving(saving);
    } finally {
      _$_BudgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteSaving(SavingsModel savingsModel) {
    final _$actionInfo = _$_BudgetStoreActionController.startAction(
        name: '_BudgetStore.deleteSaving');
    try {
      return super.deleteSaving(savingsModel);
    } finally {
      _$_BudgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editSaving(int index, SavingsModel updatedSaving) {
    final _$actionInfo = _$_BudgetStoreActionController.startAction(
        name: '_BudgetStore.editSaving');
    try {
      return super.editSaving(index, updatedSaving);
    } finally {
      _$_BudgetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
earningsList: ${earningsList}
    ''';
  }
}
