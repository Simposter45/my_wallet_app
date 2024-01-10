// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$categoryListAtom =
      Atom(name: '_ProfileStore.categoryList', context: context);

  @override
  ObservableList<CategoryModel> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(ObservableList<CategoryModel> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  late final _$categoryAtom =
      Atom(name: '_ProfileStore.category', context: context);

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$isEditModeAtom =
      Atom(name: '_ProfileStore.isEditMode', context: context);

  @override
  bool get isEditMode {
    _$isEditModeAtom.reportRead();
    return super.isEditMode;
  }

  @override
  set isEditMode(bool value) {
    _$isEditModeAtom.reportWrite(value, super.isEditMode, () {
      super.isEditMode = value;
    });
  }

  late final _$selectedSubjectsAtom =
      Atom(name: '_ProfileStore.selectedSubjects', context: context);

  @override
  ObservableList<bool> get selectedSubjects {
    _$selectedSubjectsAtom.reportRead();
    return super.selectedSubjects;
  }

  @override
  set selectedSubjects(ObservableList<bool> value) {
    _$selectedSubjectsAtom.reportWrite(value, super.selectedSubjects, () {
      super.selectedSubjects = value;
    });
  }

  late final _$selectedCurrencyIndexAtom =
      Atom(name: '_ProfileStore.selectedCurrencyIndex', context: context);

  @override
  int get selectedCurrencyIndex {
    _$selectedCurrencyIndexAtom.reportRead();
    return super.selectedCurrencyIndex;
  }

  @override
  set selectedCurrencyIndex(int value) {
    _$selectedCurrencyIndexAtom.reportWrite(value, super.selectedCurrencyIndex,
        () {
      super.selectedCurrencyIndex = value;
    });
  }

  late final _$selectedAnsQuestion1Atom =
      Atom(name: '_ProfileStore.selectedAnsQuestion1', context: context);

  @override
  int get selectedAnsQuestion1 {
    _$selectedAnsQuestion1Atom.reportRead();
    return super.selectedAnsQuestion1;
  }

  @override
  set selectedAnsQuestion1(int value) {
    _$selectedAnsQuestion1Atom.reportWrite(value, super.selectedAnsQuestion1,
        () {
      super.selectedAnsQuestion1 = value;
    });
  }

  late final _$selectedAnsQuestion2Atom =
      Atom(name: '_ProfileStore.selectedAnsQuestion2', context: context);

  @override
  int get selectedAnsQuestion2 {
    _$selectedAnsQuestion2Atom.reportRead();
    return super.selectedAnsQuestion2;
  }

  @override
  set selectedAnsQuestion2(int value) {
    _$selectedAnsQuestion2Atom.reportWrite(value, super.selectedAnsQuestion2,
        () {
      super.selectedAnsQuestion2 = value;
    });
  }

  late final _$selectedAnsQuestion3Atom =
      Atom(name: '_ProfileStore.selectedAnsQuestion3', context: context);

  @override
  int get selectedAnsQuestion3 {
    _$selectedAnsQuestion3Atom.reportRead();
    return super.selectedAnsQuestion3;
  }

  @override
  set selectedAnsQuestion3(int value) {
    _$selectedAnsQuestion3Atom.reportWrite(value, super.selectedAnsQuestion3,
        () {
      super.selectedAnsQuestion3 = value;
    });
  }

  late final _$selectedAnsQuestion4Atom =
      Atom(name: '_ProfileStore.selectedAnsQuestion4', context: context);

  @override
  int get selectedAnsQuestion4 {
    _$selectedAnsQuestion4Atom.reportRead();
    return super.selectedAnsQuestion4;
  }

  @override
  set selectedAnsQuestion4(int value) {
    _$selectedAnsQuestion4Atom.reportWrite(value, super.selectedAnsQuestion4,
        () {
      super.selectedAnsQuestion4 = value;
    });
  }

  late final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore', context: context);

  @override
  void toggleEditMode() {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.toggleEditMode');
    try {
      return super.toggleEditMode();
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSubjectSelected(bool value, int index) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setSubjectSelected');
    try {
      return super.setSubjectSelected(value, index);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCatergories(String category) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.addCatergories');
    try {
      return super.addCatergories(category);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editCategory(CategoryModel oldCategory, String newCategory) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.editCategory');
    try {
      return super.editCategory(oldCategory, newCategory);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteCategory(CategoryModel category) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.deleteCategory');
    try {
      return super.deleteCategory(category);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCurrency(int index) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setSelectedCurrency');
    try {
      return super.setSelectedCurrency(index);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuestion1Ans(int index) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setQuestion1Ans');
    try {
      return super.setQuestion1Ans(index);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuestion2Ans(int index) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setQuestion2Ans');
    try {
      return super.setQuestion2Ans(index);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuestion3Ans(int index) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setQuestion3Ans');
    try {
      return super.setQuestion3Ans(index);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuestion4Ans(int index) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setQuestion4Ans');
    try {
      return super.setQuestion4Ans(index);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryList: ${categoryList},
category: ${category},
isEditMode: ${isEditMode},
selectedSubjects: ${selectedSubjects},
selectedCurrencyIndex: ${selectedCurrencyIndex},
selectedAnsQuestion1: ${selectedAnsQuestion1},
selectedAnsQuestion2: ${selectedAnsQuestion2},
selectedAnsQuestion3: ${selectedAnsQuestion3},
selectedAnsQuestion4: ${selectedAnsQuestion4}
    ''';
  }
}
