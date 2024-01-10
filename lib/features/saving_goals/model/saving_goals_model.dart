class SavingGoalsModel {
  String itemName;
  double amounttoSave;
  double yourContribution;
  String period;
  String date;
  String? notes;

  SavingGoalsModel({
    required this.itemName,
    required this.amounttoSave,
    required this.yourContribution,
    required this.period,
    required this.date,
    this.notes,
  });
}
