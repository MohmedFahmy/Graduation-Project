import 'package:flutter/material.dart';

class ShipmentWeightAndCount extends StatelessWidget {
  final TextEditingController weightController;
  final TextEditingController countController;
  final VoidCallback onChanged;

  const ShipmentWeightAndCount({
    super.key,
    required this.weightController,
    required this.countController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shipment Weight',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 21, 54, 112)),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: TextFormField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          onChanged: (_) => onChanged(),
                          decoration:
                              const InputDecoration.collapsed(hintText: "0"),
                        ),
                      ),
                      const VerticalDivider(
                          width: 20, thickness: 2, color: Colors.black),
                      const Text(
                        'KG',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pieces Number',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 21, 54, 112)),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          controller: countController,
                          keyboardType: TextInputType.number,
                          onChanged: (_) => onChanged(),
                          decoration:
                              const InputDecoration.collapsed(hintText: "0"),
                        ),
                      ),
                      const VerticalDivider(
                          width: 20, thickness: 2, color: Colors.black),
                      const Text(
                        'Pieces',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
