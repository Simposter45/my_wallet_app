import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/expenses_model.dart';
import '../model/notifications_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  ObservableList<ExpenseModel> expenseItems = ObservableList<ExpenseModel>();
  @observable
  ObservableList<ExpenseModel> expectedPaymentItems =
      ObservableList<ExpenseModel>();
  @observable
  ObservableList<NotificationModel> notificationItems =
      ObservableList<NotificationModel>.of(notificationList);

  @observable
  double amount = 0;

  @observable
  String paymentType = '';

  @observable
  IconData selectedCategoryIcon = Icons.shopping_bag_rounded;

  @observable
  String selectedPeriod = '1 week';

  @observable
  bool isPageOpen = false;

  @observable
  bool isEditOn = false;

  @action
  void setAmount(double value) {
    amount = value;
  }

  @action
  void setPaymentType(String type) {
    paymentType = type;
  }

  @action
  void setSelectedCategoryIcon(IconData icon) {
    selectedCategoryIcon = icon;
  }

  @action
  void setSelectedPeriod(String period) {
    selectedPeriod = period;
  }

  @action
  void setStatus(ExpenseModel expenseModel) {
    final index = expenseItems.indexWhere((user) => user == expenseModel);

    if (index != -1) {
      expenseItems[index] =
          expenseItems[index].copyWith(status: !expenseItems[index].status);
    }
  }

  @action
  void addItem(String itemName, double amount, IconData icon, String period,
      String paymentType) {
    final item = ExpenseModel(
      itemName: itemName,
      icon: icon,
      amount: amount,
      period: period,
      paymentType: paymentType,
      date: 'June 25, 2023',
      bank: 'DBS Bank',
      status: false,
    );
    expenseItems.add(item);
  }

  @action
  void deleteExpense(ExpenseModel expenseModel) {
    expenseItems.remove(expenseModel);
  }

  @action
  void setPageOpen(bool value) {
    isPageOpen = value;
  }

  @action
  void setIsEditOn() {
    isEditOn = true;
  }

  //--------------- Notification Screen tasks --------------

  @action
  void setIsRead(NotificationModel notificationModel) {
    final index =
        notificationItems.indexWhere((user) => user == notificationModel);

    if (index != -1) {
      notificationItems[index] =
          notificationItems[index].copyWith(status: true);
    }
  }

  @action
  void deleteNotifications(NotificationModel notificationModel) {
    notificationItems.remove(notificationModel);
  }
}
