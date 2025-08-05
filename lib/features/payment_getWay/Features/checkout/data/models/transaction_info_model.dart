class TransactionInfoModel {
  String? senderName;
  String? recipientName;
  String? userNumber;
  String? departure;
  String? arrival;
  int? weightKg;
  int? itemCount;
  double? price;

  String? userNumberForTicket;
  String? ticketId;
  String? seatNumber;
  String? date;

  TransactionInfoModel({
    this.senderName = "Mohamed",
    this.recipientName = "Ali",
    this.userNumber = "USER123",
    this.departure = "Tanta",
    this.arrival = "Cairo",
    this.weightKg = 50,
    this.itemCount = 3,
    this.price = 1000,
    this.userNumberForTicket,
    this.ticketId,
    this.seatNumber,
    this.date,
  });
}
