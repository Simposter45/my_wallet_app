import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class SavingsModel {
  SavingsModel({
    required this.name,
    required this.totalAmount,
    required this.savingAmount,
    required this.dueDate,
    required this.period,
    required this.color,
    this.notes,
  });
  String name;
  double totalAmount;
  double savingAmount;
  String dueDate;
  String period;
  Color color;
  String? notes;
}

List<SavingsModel> savingList = [
  SavingsModel(
    name: 'Ifun 1',
    totalAmount: 699,
    savingAmount: 199,
    dueDate: '29th Jan',
    period: 'Every Month',
    color: AppColors.red,
  ),
  SavingsModel(
    name: 'Ifun 2',
    totalAmount: 699,
    savingAmount: 199,
    dueDate: '29th Jan',
    period: 'Every Month',
    color: AppColors.red,
  ),
  SavingsModel(
    name: 'Ifun 3',
    totalAmount: 699,
    savingAmount: 199,
    dueDate: '29th Jan',
    period: 'Every Month',
    color: AppColors.red,
  ),
  SavingsModel(
    name: 'Ifun 4',
    totalAmount: 699,
    savingAmount: 199,
    dueDate: '29th Jan',
    period: 'Every Month',
    color: AppColors.red,
  ),
  SavingsModel(
    name: 'Ifun 5',
    totalAmount: 699,
    savingAmount: 199,
    dueDate: '29th Jan',
    period: 'Every Month',
    color: AppColors.red,
  ),
  SavingsModel(
    name: 'Ifun 6',
    totalAmount: 699,
    savingAmount: 199,
    dueDate: '29th Jan',
    period: 'Every Month',
    color: AppColors.red,
  ),
  SavingsModel(
    name: 'Ifun 7',
    totalAmount: 699,
    savingAmount: 199,
    dueDate: '29th Jan',
    period: 'Every Month',
    color: AppColors.red,
  ),
  SavingsModel(
    name: 'Ifun 8',
    totalAmount: 699,
    savingAmount: 199,
    dueDate: '29th Jan',
    period: 'Every Month',
    color: AppColors.red,
  ),
];
