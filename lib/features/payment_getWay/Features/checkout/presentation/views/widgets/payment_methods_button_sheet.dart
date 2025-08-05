import 'package:flutter/material.dart';

import '../../../data/models/transaction_info_model.dart';
import 'custom_button_block_consumer.dart';
import 'payment_method_item.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  final double amount;
  final TransactionInfoModel transactionInfo;
  const PaymentMethodsBottomSheet(
      {super.key, required this.amount, required this.transactionInfo});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  int activeIndex = 0;

  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
    'assets/images/fawry.svg',
    'assets/images/orange.svg',
    'assets/images/vodafone.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 62,
              child: ListView.builder(
                  itemCount: paymentMethodsItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          activeIndex = index;
                          setState(() {});
                        },
                        child: PaymentMethodItem(
                          isActive: activeIndex == index,
                          image: paymentMethodsItems[index],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 32,
            ),
            CustomButtonBlockConsumer(
              amount: widget.amount,
              activeIndex: activeIndex,
              transactionInfoModel: widget.transactionInfo,
            ),
          ],
        ),
      ),
    );
  }
}
