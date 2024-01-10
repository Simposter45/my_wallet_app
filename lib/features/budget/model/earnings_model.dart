import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class EarningsModel {
  EarningsModel({
    required this.name,
    required this.amount,
    required this.dueDate,
    required this.period,
    required this.color,
    this.notes,
  });
  String name;
  double amount;
  String dueDate;
  String period;
  Color color;
  String? notes;
}

List<EarningsModel> earningList = [
  EarningsModel(
    name: 'Upwork',
    amount: 3000,
    dueDate: '28th Jan',
    period: 'Every Month',
    color: AppColors.earningTextColor1,
  ),
  EarningsModel(
    name: 'Freepik',
    amount: 3000,
    dueDate: '28th Jan',
    period: 'Every Month',
    color: AppColors.earningTextColor2,
  ),
  EarningsModel(
    name: 'Envato',
    amount: 3000,
    dueDate: '28th Jan',
    period: 'Every Month',
    color: AppColors.earningTextColor3,
  ),
];
