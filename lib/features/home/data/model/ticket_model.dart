class TicketModel {
  String id;
  String departure;
  String arrival;
  num price;
  String time;
  String date;
  String trainClass;
  bool isOfer;

  TicketModel({
    required this.id,
    required this.departure,
    required this.arrival,
    required this.price,
    required this.time,
    required this.date,
    required this.trainClass,
    required this.isOfer,
  });
  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['_id'],
      departure: json['departure'],
      arrival: json['arrival'],
      price: json['price'],
      time: json['time'],
      date: json['date'],
      trainClass: json['trainClass'],
      isOfer: json['offer'],
    );
  }
}
