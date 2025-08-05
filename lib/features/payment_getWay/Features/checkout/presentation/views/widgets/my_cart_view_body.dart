
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/transaction_info_model.dart';
import '../../../data/repos/checkout_repo_imple.dart';
import '../../manager/cubit/payment_cubit.dart';
import 'payment_methods_button_sheet.dart';

class MyCartViewBody extends StatelessWidget {
  final TransactionInfoModel transactionInfoModel;

  const MyCartViewBody({super.key, required this.transactionInfoModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: transactionInfoModel.ticketId == null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .2,
                    ),
                    TextInPaymentDetails(
                      text1: 'Sender Name : ',
                      text2: transactionInfoModel.senderName!,
                    ),
                    TextInPaymentDetails(
                      text1: 'Recipient Name : ',
                      text2: transactionInfoModel.recipientName!,
                    ),
                    TextInPaymentDetails(
                      text1: 'User Number : ',
                      text2: transactionInfoModel.userNumber!,
                    ),
                    TextInPaymentDetails(
                      text1: 'Departure : ',
                      text2: transactionInfoModel.departure!,
                    ),
                    TextInPaymentDetails(
                      text1: 'Arrival : ',
                      text2: transactionInfoModel.arrival!,
                    ),
                    TextDoubleInPaymentDetails(
                        text: 'Weight (Kg) :',
                        doubleText: transactionInfoModel.weightKg!),
                    TextDoubleInPaymentDetails(
                        text: 'Item Count :',
                        doubleText: transactionInfoModel.itemCount!),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                      height: 20,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price : ',
                          style: Styles.style22.copyWith(color: Colors.black),
                        ),
                        Text(
                          '${transactionInfoModel.price!}',
                          style: Styles.style22.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButton(
                      text: 'Complete Payment',
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          builder: (context) {
                            return BlocProvider(
                              create: (context) =>
                                  PaymentCubit(CheckoutRepoImple()),
                              child: PaymentMethodsBottomSheet(
                                amount: transactionInfoModel.price!,
                                transactionInfo: transactionInfoModel,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Spacer(),
                    CustomButton(
                      text: 'Complete Payment',
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          builder: (context) {
                            return BlocProvider(
                              create: (context) =>
                                  PaymentCubit(CheckoutRepoImple()),
                              child: PaymentMethodsBottomSheet(
                                amount: transactionInfoModel.price!,
                                transactionInfo: transactionInfoModel,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ));
  }
}

class TextInPaymentDetails extends StatelessWidget {
  final String text1;
  final String text2;
  const TextInPaymentDetails({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: Styles.style20,
        ),
        Text(
          text2,
          style: Styles.style20,
        ),
      ],
    );
  }
}

class TextDoubleInPaymentDetails extends StatelessWidget {
  final String text;
  final int doubleText;
  const TextDoubleInPaymentDetails(
      {super.key, required this.text, required this.doubleText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.style20,
        ),
        Text(
          '$doubleText',
          style: Styles.style20,
        ),
      ],
    );
  }
}
