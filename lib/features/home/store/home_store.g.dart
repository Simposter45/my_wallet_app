// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$expenseItemsAtom =
      Atom(name: '_HomeStore.expenseItems', context: context);

  @override
  ObservableList<ExpenseModel> get expenseItems {
    _$expenseItemsAtom.reportRead();
    return super.expenseItems;
  }

  @override
  set expenseItems(ObservableList<ExpenseModel> value) {
    _$expenseItemsAtom.reportWrite(value, super.expenseItems, () {
      super.expenseItems = value;
    });
  }

  late final _$expectedPaymentItemsAtom =
      Atom(name: '_HomeStore.expectedPaymentItems', context: context);

  @override
  ObservableList<ExpenseModel> get expectedPaymentItems {
    _$expectedPaymentItemsAtom.reportRead();
    return super.expectedPaymentItems;
  }

  @override
  set expectedPaymentItems(ObservableList<ExpenseModel> value) {
    _$expectedPaymentItemsAtom.reportWrite(value, super.expectedPaymentItems,
        () {
      super.expectedPaymentItems = value;
    });
  }

  late final _$notificationItemsAtom =
      Atom(name: '_HomeStore.notificationItems', context: context);

  @override
  ObservableList<NotificationModel> get notificationItems {
    _$notificationItemsAtom.reportRead();
    return super.notificationItems;
  }

  @override
  set notificationItems(ObservableList<NotificationModel> value) {
    _$notificationItemsAtom.reportWrite(value, super.notificationItems, () {
      super.notificationItems = value;
    });
  }

  late final _$amountAtom = Atom(name: '_HomeStore.amount', context: context);

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$paymentTypeAtom =
      Atom(name: '_HomeStore.paymentType', context: context);

  @override
  String get paymentType {
    _$paymentTypeAtom.reportRead();
    return super.paymentType;
  }

  @override
  set paymentType(String value) {
    _$paymentTypeAtom.reportWrite(value, super.paymentType, () {
      super.paymentType = value;
    });
  }

  late final _$selectedCategoryIconAtom =
      Atom(name: '_HomeStore.selectedCategoryIcon', context: context);

  @override
  IconData get selectedCategoryIcon {
    _$selectedCategoryIconAtom.reportRead();
    return super.selectedCategoryIcon;
  }

  @override
  set selectedCategoryIcon(IconData value) {
    _$selectedCategoryIconAtom.reportWrite(value, super.selectedCategoryIcon,
        () {
      super.selectedCategoryIcon = value;
    });
  }

  late final _$selectedPeriodAtom =
      Atom(name: '_HomeStore.selectedPeriod', context: context);

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
      Atom(name: '_HomeStore.isPageOpen', context: context);

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

  late final _$isEditOnAtom =
      Atom(name: '_HomeStore.isEditOn', context: context);

  @override
  bool get isEditOn {
    _$isEditOnAtom.reportRead();
    return super.isEditOn;
  }

  @override
  set isEditOn(bool value) {
    _$isEditOnAtom.reportWrite(value, super.isEditOn, () {
      super.isEditOn = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setAmount(double value) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setAmount');
    try {
      return super.setAmount(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaymentType(String type) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setPaymentType');
    try {
      return super.setPaymentType(type);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategoryIcon(IconData icon) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setSelectedCategoryIcon');
    try {
      return super.setSelectedCategoryIcon(icon);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedPeriod(String period) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setSelectedPeriod');
    try {
      return super.setSelectedPeriod(period);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(ExpenseModel expenseModel) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setStatus');
    try {
      return super.setStatus(expenseModel);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(String itemName, double amount, IconData icon, String period,
      String paymentType) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.addItem');
    try {
      return super.addItem(itemName, amount, icon, period, paymentType);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteExpense(ExpenseModel expenseModel) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.deleteExpense');
    try {
      return super.deleteExpense(expenseModel);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageOpen(bool value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setPageOpen');
    try {
      return super.setPageOpen(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEditOn() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setIsEditOn');
    try {
      return super.setIsEditOn();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsRead(NotificationModel notificationModel) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setIsRead');
    try {
      return super.setIsRead(notificationModel);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteNotifications(NotificationModel notificationModel) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.deleteNotifications');
    try {
      return super.deleteNotifications(notificationModel);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expenseItems: ${expenseItems},
expectedPaymentItems: ${expectedPaymentItems},
notificationItems: ${notificationItems},
amount: ${amount},
paymentType: ${paymentType},
selectedCategoryIcon: ${selectedCategoryIcon},
selectedPeriod: ${selectedPeriod},
isPageOpen: ${isPageOpen},
isEditOn: ${isEditOn}
    ''';
  }
}
