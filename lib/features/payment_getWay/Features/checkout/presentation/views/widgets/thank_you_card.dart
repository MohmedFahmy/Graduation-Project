
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/models/transaction_info_model.dart';
import 'card_info_widget.dart';
import 'payment_info_item.dart';
import 'total_price_widget.dart';


class ThankYouCard extends StatelessWidget {
  final TransactionInfoModel transactionInfo;
  final DateTime paymentDateTime;

  ThankYouCard({
    super.key,
    required this.transactionInfo,
  }) : paymentDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final shortestSide = mediaQuery.size.shortestSide;

    // Adjust text scaling based on screen size
    final textScaleFactor = mediaQuery.textScaleFactor.clamp(0.8, 1.2);
    final isSmallScreen = shortestSide < 600;

    final formattedDate = DateFormat('dd/MM/yyyy').format(paymentDateTime);
    final formattedTime = DateFormat('hh:mm a').format(paymentDateTime);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(20),
      ),
      child: MediaQuery(
        data: mediaQuery.copyWith(textScaleFactor: textScaleFactor),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                top: constraints.maxHeight * 0.1,
                left: isSmallScreen ? 16 : 22,
                right: isSmallScreen ? 16 : 22,
                bottom: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeaderSection(isSmallScreen),
                  SizedBox(height: constraints.maxHeight * 0.04),
                  _buildDateTimeSection(formattedDate, formattedTime),
                  SizedBox(height: constraints.maxHeight * 0.04),
                  const Divider(height: 1, thickness: 2),
                  SizedBox(height: constraints.maxHeight * 0.04),
                  TotalPrice(
                    title: 'Total',
                    value: '${transactionInfo.price} EGP',
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 30),
                  const CardInfoWidget(),
                  const Spacer(),
                  _buildFooterSection(isSmallScreen),
                  SizedBox(height: constraints.maxHeight * 0.05),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderSection(bool isSmallScreen) {
    return Column(
      children: [
        Text(
          'Thank you!',
          style: isSmallScreen
              ? Styles.style25
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold)
              : Styles.style25.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Your transaction was successful',
          style: isSmallScreen
              ? Styles.style20.copyWith(fontSize: 16)
              : Styles.style20,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDateTimeSection(String date, String time) {
    return Column(
      children: [
        PaymentItemInfo(title: 'Date', value: date),
        const SizedBox(height: 12),
        PaymentItemInfo(title: 'Time', value: time),
      ],
    );
  }

  Widget _buildFooterSection(bool isSmallScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 30),
          child: Row(
            children: List.generate(
              2,
              (_) => Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isSmallScreen ? 4 : 8),
                child: Icon(
                  FontAwesomeIcons.barcode,
                  size: isSmallScreen ? 36 : 48,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: isSmallScreen ? 80 : 100,
          height: isSmallScreen ? 36 : 48,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF34A853), width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'PAID',
              style: Styles.style20.copyWith(
                fontSize: isSmallScreen ? 16 : 20,
                color: const Color(0xFF34A853),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
