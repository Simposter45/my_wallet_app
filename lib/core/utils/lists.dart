import 'package:flutter/material.dart';

List<String> currencyList = [
  'United States (USD)',
  'Indonesia (IDR)',
  'Japan (JPY)',
  'Russia (RUB)',
  'Germany (EUR)',
  'Korea (WON)',
  'India (INR)',
  'Singapore (SGD)',
];

List<String> countryList = [
  'United States',
  'United Kingdom',
  'India',
];
List<String> views = ['Daily', 'Weekly', 'Monthly'];

Map<IconData, String> iconsMap = {
  for (int i = 0; i < iconsList.length; i++) iconsList[i]: categoryList[i],
};

List<IconData> iconsList = [
  Icons.shopping_bag_rounded,
  Icons.wifi,
  Icons.house_rounded,
  Icons.food_bank_rounded,
  Icons.sports_gymnastics_rounded,
  Icons.fastfood_rounded,
  Icons.local_gas_station_rounded,
  Icons.receipt_rounded,
];

List<String> categoryList = [
  'Shopping',
  'Wifi',
  'House',
  'Food',
  'Gym',
  'Fast Food',
  'Petrol',
  'Bill',
];

List<String> banksList = [
  'DBS Bank',
  'A Bank',
  'B Bank',
  'C Bank',
  'D Bank',
];

List<String> statusList = [
  'Pending',
  'Paid',
];

List<String> periodsList = [
  '1 week',
  '2 weeks',
  '3 weeks',
  '1 month',
  '3 months',
  '6 months',
];

//survey Form
List<String> question1 = [
  'Daily',
  'Weekly',
  'Monthly',
  'Rarely',
  'Never',
];

List<String> question3 = [
  'Bill payments and reminders',
  'Budgeting and expense tracking',
  'Savings and goal setting',
  'Other (please specify)',
];
List<String> question6 = [
  'Definitely',
  'Probably',
  'Undecided',
  'Probably Not',
  'Definitely Not',
];
List<String> question7 = [
  'Excellent',
  'Good',
  'Average',
  'Below Average',
  'Poor',
];
List<String> question10 = [
  'Very Satisfied',
  'Satisfied',
  'Neutral',
  'Dissatisfied',
  'Very Dissatisfied',
];
