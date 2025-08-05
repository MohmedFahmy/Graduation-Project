
import 'package:flutter/material.dart';

import '../../appbar_title.dart';
import '../../data/models/transaction_info_model.dart';
import 'widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  static const String routeName = '/mycartview';
  final TransactionInfoModel transactionInfoModel;
  const MyCartView({super.key, required this.transactionInfoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: AppBarTitle()),
      ),
      body: MyCartViewBody(
        transactionInfoModel: TransactionInfoModel(),
      ),
    );
  }
}
