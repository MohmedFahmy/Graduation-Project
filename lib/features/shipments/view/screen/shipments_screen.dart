import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/core/styles/app_colors.dart';
import 'package:graduation_app/features/home/view/widget/custom_drawer.dart';
import 'package:graduation_app/features/shipments/cubit/shipments_cubit.dart';
import 'package:graduation_app/features/shipments/cubit/shipments_state.dart';

class ShipmentScreen extends StatefulWidget {
  const ShipmentScreen({super.key});

  @override
  State<ShipmentScreen> createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {
  final TextEditingController _userNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawerWidget(),
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          "Track Shipments",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '"You can get your shipments by entering your user number"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 21, 54, 112),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _userNumberController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Enter your User Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                final userNumber = _userNumberController.text.trim();
                if (userNumber.isNotEmpty) {
                  context
                      .read<ShipmentsCubit>()
                      .fetchShipments(userNumber: userNumber);
                }
              },
              child: const Text(
                "Get My Shipments",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ShipmentsCubit, ShipmentsState>(
                builder: (context, state) {
                  if (state is ShipmentsLoaded) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ShipmentsSuccess) {
                    if (state.shipments.isEmpty) {
                      return const Center(child: Text("No shipments found."));
                    }

                    return ListView.builder(
                      itemCount: state.shipments.length,
                      itemBuilder: (context, index) {
                        final s = state.shipments[index];
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${s.departure} ➞ ${s.arrival}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    BarcodeWidget(
                                      barcode: Barcode.code128(),
                                      data: s.id ?? '',
                                      width: 180,
                                      height: 50,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Divider(color: Colors.grey[400]),
                                Row(
                                  children: [
                                    Text(
                                      'From: ${s.senderName}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 140),
                                    Text(
                                      'To: ${s.recipientName}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Divider(color: Colors.grey[400]),
                                Row(
                                  children: [
                                    Text(
                                      'Weight: ${s.weightKg} kg',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 145),
                                    Text(
                                      'Items: ${s.itemCount}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Divider(color: Colors.grey[400]),
                                Text(
                                  'Delivery Time: ${s.estimatedDays}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(Icons.monetization_on,
                                        color: Colors.green),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Price: ${s.price.toStringAsFixed(2)} EGP',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Created at: ${s.createdAt?.split("T").first ?? ''}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
