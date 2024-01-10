import 'package:flutter/material.dart';

class ExpensesModel {
  ExpensesModel({
    required this.iconData,
    required this.name,
    required this.amount,
    required this.date,
    required this.reminder,
    required this.category,
    required this.bank,
    required this.status,
    required this.notes,
  });
  IconData iconData;
  String name;
  double amount;
  String date;
  String reminder;
  String category;
  String bank;
  bool status;
  String notes;
}
