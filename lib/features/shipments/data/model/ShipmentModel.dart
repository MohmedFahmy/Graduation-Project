class ShipmentModel {
  final String? id;
  final String senderName;
  final String recipientName;
  final String userNumber;
  final String departure;
  final String arrival;
  final num weightKg;
  final num itemCount;
  final String? estimatedDays;
  final num price;
  final String? createdAt;

  ShipmentModel({
    this.id,
    required this.senderName,
    required this.recipientName,
    required this.userNumber,
    required this.departure,
    required this.arrival,
    required this.weightKg,
    required this.itemCount,
    required this.price,
    this.estimatedDays,
    this.createdAt,
  });

  /// عند استلام البيانات من API
  factory ShipmentModel.fromJson(Map<String, dynamic> json) {
    return ShipmentModel(
      id: json['_id'],
      senderName: json['senderName'],
      recipientName: json['recipientName'],
      userNumber: json['userNumber'],
      departure: json['departure'],
      arrival: json['arrival'],
      weightKg: (json['weightKg'] as num).toDouble(),
      itemCount: json['itemCount'],
      estimatedDays: json['estimatedDays'],
      price: (json['price'] as num).toDouble(),
      createdAt: json['createdAt'],
    );
  }

  // /// عند إرسال البيانات إلى API
  // Map<String, dynamic> toJson() {
  //   return {
  //     'senderName': senderName,
  //     'recipientName': recipientName,
  //     'userNumber': userNumber,
  //     'departure': departure,
  //     'arrival': arrival,
  //     'weightKg': weightKg,
  //     'itemCount': itemCount,
  //     'price': price,
  //   };
  // }
}
