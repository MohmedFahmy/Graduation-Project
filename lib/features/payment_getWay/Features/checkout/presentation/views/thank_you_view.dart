
import 'package:flutter/material.dart';

import '../../data/models/transaction_info_model.dart';
import 'widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  final TransactionInfoModel transactionInfo;

  const ThankYouView({super.key, required this.transactionInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 40,
        ),
      ),
      body: ThankYouViewBody(
        transactionInfo: transactionInfo,
      ),
    );
  }
}
