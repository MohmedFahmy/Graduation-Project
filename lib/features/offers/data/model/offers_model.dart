class OfferModel {
  final String id;
  final String departure;
  final String arrival;
  final num price;
  final String time;
  final String date;
  final String trainClass;
  final bool offer;
  final num discountPercentage;

  OfferModel({
    required this.id,
    required this.departure,
    required this.arrival,
    required this.price,
    required this.time,
    required this.date,
    required this.trainClass,
    required this.offer,
    required this.discountPercentage,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    final ticket = json['ticket'];
    return OfferModel(
      id: ticket['_id'],
      departure: ticket['departure'],
      arrival: ticket['arrival'],
      price: ticket['price'],
      time: ticket['time'],
      date: ticket['date'],
      trainClass: ticket['trainClass'],
      offer: ticket['offer'],
      discountPercentage: json['discountPercentage'],
    );
  }
}
