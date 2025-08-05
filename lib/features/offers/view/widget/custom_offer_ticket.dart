import 'package:flutter/material.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../payment_getWay/Features/checkout/data/models/transaction_info_model.dart';
import '../../../payment_getWay/Features/checkout/presentation/views/my_cart_view.dart';

class CustomOfferTicket extends StatelessWidget {
  const CustomOfferTicket({
    super.key,
    required this.trainClass,
    required this.price,
    required this.departure,
    required this.arrival,
    required this.getMyTrainImage,
    required this.date,
    required this.time,
    required this.isOferd,
    this.buttonLabel = 'Booking',
    this.buttonIcon = const Icon(Icons.add, size: 25, color: Colors.white),
    required this.discount,
  });
  final String trainClass;
  final num price;
  final String departure;
  final String arrival;
  final String Function(String) getMyTrainImage;
  final String date;
  final String time;
  final bool isOferd;
  final String buttonLabel;
  final Icon buttonIcon;
  final num discount;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  getMyTrainImage(trainClass),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              if (isOferd)
                Positioned(
                  child: Container(
                    width: 80,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Offer',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "From: ${departure}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      "To: ${arrival}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Date: ${date}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      "Time: ${time}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Class: ${trainClass}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Price:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Column(children: [
                            Text(
                              "${price - (price * discount / 100)}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              price.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ])
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text('Discount: ${discount} \%',
                      style: TextStyle(color: Colors.grey[800], fontSize: 18)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyCartView(
                              transactionInfoModel: TransactionInfoModel(),
                            )));
              },
              label: Text(
                buttonLabel,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              icon: buttonIcon,
            ),
          ),
        ],
      ),
    );
  }
}
