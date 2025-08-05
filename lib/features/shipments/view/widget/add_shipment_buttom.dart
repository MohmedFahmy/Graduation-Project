import 'package:flutter/material.dart';

import '../../../../core/styles/app_colors.dart';

class AddShipmentButton extends StatelessWidget {
  const AddShipmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: API POST
      },
      label: const Text(
        'Add Shipment',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      icon: const Icon(Icons.add, color: Colors.white, size: 30),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: AppColors.kPrimaryColor,
      ),
    );
  }
}