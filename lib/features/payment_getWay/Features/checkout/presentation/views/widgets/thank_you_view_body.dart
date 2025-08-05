
import 'package:flutter/material.dart';

import '../../../data/models/transaction_info_model.dart';
import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';
import 'thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  final TransactionInfoModel transactionInfo;

  const ThankYouViewBody({super.key, required this.transactionInfo});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      padding: EdgeInsets.only(
        right: screenWidth / 20,
        left: screenWidth / 20,
        top: screenHeight / 15,
        bottom: screenHeight / 20,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(transactionInfo: transactionInfo),
          Positioned(
            bottom: screenHeight * .2 + 20,
            left: 28,
            right: 28,
            child: const CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            bottom: screenHeight * .2,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            right: -20,
            bottom: screenHeight * .2,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            top: -40,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
