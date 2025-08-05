import 'package:flutter/material.dart';

class ShipmentPriceWidget extends StatelessWidget {
  final num price;

  const ShipmentPriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Shipment Price: ${price.toStringAsFixed(2)} EGP',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.green[800],
        ),
      ),
    );
  }
}
