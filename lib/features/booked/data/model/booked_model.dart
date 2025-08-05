class BookedModel {
  final String id;
  final String userNumber;
  final String ticketId;
  final String seatNumber;
  final String bookingDate;

  // من ticketDetails
  final String departure;
  final String arrival;
  final int price;
  final String time;
  final String trainClass;
  final String ticketDate;
  final bool offer;

  final String date;

  BookedModel({
    required this.id,
    required this.userNumber,
    required this.ticketId,
    required this.seatNumber,
    required this.bookingDate,
    required this.departure,
    required this.arrival,
    required this.price,
    required this.date,
    required this.time,
    required this.trainClass,
    required this.ticketDate,
    required this.offer,
  });

  factory BookedModel.fromJson(Map<String, dynamic> json) {
    final ticket = json['ticketDetails'];

    return BookedModel(
      id: json['_id'],
      userNumber: json['userNumber'],
      ticketId: json['ticketId'],
      seatNumber: json['seatNumber'],
      bookingDate: json['date'],
      departure: ticket['departure'],
      arrival: ticket['arrival'],
      price: ticket['price'],
      time: ticket['time'],
      trainClass: ticket['trainClass'],
      ticketDate: ticket['date'],
      offer: ticket['offer'],
      date: ticket['date'],
    );
  }
}
