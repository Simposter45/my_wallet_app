class NotificationModel {
  NotificationModel({
    required this.amount,
    required this.payerName,
    required this.time,
    required this.date,
    required this.isPayble,
    required this.isread,
    this.isPaid,
  });
  double amount;
  String payerName;
  String time;
  String date;
  bool isPayble;
  bool? isPaid;
  bool isread;

  NotificationModel copyWith({bool? status}) {
    return NotificationModel(
      amount: amount,
      payerName: payerName,
      date: date,
      isPayble: isPayble,
      time: time,
      isread: status ?? isread,
    );
  }
}

final notificationList = [
  NotificationModel(
    amount: 450,
    payerName: 'Noah Johnson',
    time: 'TIME',
    date: 'date',
    isPayble: false,
    isread: false,
  ),
  NotificationModel(
    amount: 450,
    payerName: 'Noah Johnson',
    time: 'TIME',
    date: 'date',
    isPayble: false,
    isread: false,
  ),
  NotificationModel(
    amount: 450,
    payerName: 'Noah Johnson',
    time: 'TIME',
    date: 'date',
    isPayble: false,
    isread: false,
  ),
  NotificationModel(
    amount: 450,
    payerName: 'Noah Johnson',
    time: 'TIME',
    date: 'date',
    isPayble: false,
    isread: false,
  ),
  NotificationModel(
    amount: 450,
    payerName: 'Noah Johnson',
    time: 'TIME',
    date: 'date',
    isPayble: false,
    isread: false,
  ),
];
