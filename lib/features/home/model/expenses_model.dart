import 'package:flutter/material.dart';

class ExpenseModel {
  ExpenseModel({
    required this.itemName,
    required this.icon,
    required this.amount,
    required this.period,
    required this.paymentType,
    required this.status,
    required this.date,
    required this.bank,
    this.notes,
  });
  String itemName;
  IconData icon;
  double amount;
  String period;
  String paymentType;
  String date;
  String bank;
  String? notes;
  bool status;

  ExpenseModel copyWith({bool? status}) {
    return ExpenseModel(
      itemName: itemName,
      icon: icon,
      amount: amount,
      period: period,
      paymentType: paymentType,
      date: 'June 25, 2023',
      bank: 'DBS Bank',
      status: status ?? this.status,
    );
  }
}
