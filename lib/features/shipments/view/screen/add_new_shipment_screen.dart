import 'package:flutter/material.dart';
import 'package:graduation_app/core/styles/app_colors.dart';
import 'package:graduation_app/features/home/view/widget/custom_drawer.dart';

import '../widget/add_shipment_buttom.dart';
import '../widget/shipment_counting.dart';
import '../widget/shipment_price.dart';

class AddNewShipmentScreen extends StatefulWidget {
  const AddNewShipmentScreen({super.key});

  @override
  State<AddNewShipmentScreen> createState() => _AddNewShipmentScreenState();
}

class _AddNewShipmentScreenState extends State<AddNewShipmentScreen> {
  final TextEditingController _userIdNumber = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _recipientName = TextEditingController();
  final TextEditingController _recipientStation = TextEditingController();
  final TextEditingController _wightNumber = TextEditingController();
  final TextEditingController _itemNumber = TextEditingController();
  num _price = 0;
  String _selectedVolume = 'Normal';

  final List<String> _volumeOptions = [
    'Small than 1 m3',
    'Normal',
    'Large than 2 m3'
  ];

  void _calculatePrice() {
    final weight = num.tryParse(_wightNumber.text) ?? 0;
    final count = num.tryParse(_itemNumber.text) ?? 0;
    num basePrice = (weight * 5) + (count * 2);

    switch (_selectedVolume) {
      case 'Small than 1 m3':
        basePrice *= 0.9;
        break;
      case 'Large than 2 m3':
        basePrice *= 1.2;
        break;
      default:
        break;
    }

    setState(() {
      _price = basePrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawerWidget(),
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Add New Shipment',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const TitleSection(
                        title: 'Please enter Your Shipment Details',
                      ),
                      const TitleSection(
                        title: '"We cant Ship Animals"',
                      ),
                      CustomInputField(
                          label: 'Enter your User Number',
                          controller: _userIdNumber),
                      CustomInputField(
                          label: 'Enter your name', controller: _userName),
                      CustomInputField(
                          label: 'Enter the name of the recipient',
                          controller: _recipientName),
                      CustomInputField(
                          label: 'Enter recipient station',
                          controller: _recipientStation),
                      ShipmentWeightAndCount(
                        weightController: _wightNumber,
                        countController: _itemNumber,
                        onChanged: _calculatePrice,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select Volume',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 21, 54, 112)),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField<String>(
                            value: _selectedVolume,
                            items: _volumeOptions
                                .map((volume) => DropdownMenuItem(
                                      value: volume,
                                      child: Text(volume),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedVolume = value!;
                              });
                              _calculatePrice();
                            },
                            decoration: InputDecoration(
                              labelText: 'The Volume',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ShipmentPriceWidget(price: _price),
                      const Spacer(),
                      const AddShipmentButton(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 21, 54, 112),
      ),
      textAlign: TextAlign.center,
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
