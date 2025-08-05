
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/make_snackbar.dart';
import '../../../../../core/utils/paypal_webview.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/payment_intent_inputmodel.dart';
import '../../../data/models/transaction_info_model.dart';
import '../../manager/cubit/payment_cubit.dart';
import '../thank_you_view.dart';

class CustomButtonBlockConsumer extends StatelessWidget {
  final int activeIndex;
  final double amount;
  final TransactionInfoModel transactionInfoModel;
  const CustomButtonBlockConsumer({
    super.key,
    required this.activeIndex,
    required this.amount,
    required this.transactionInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView(
                  transactionInfo: transactionInfoModel,
                );
              },
            ),
          );
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          makeSnackbar(context, 'Payment Canceled');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomButton(
            onTap: () {
              //make intial model to test
              if (activeIndex == 0) {
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                        amount: (amount).toInt().toString(), currency: 'EGP');
                BlocProvider.of<PaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel,
                    transactionInfo: transactionInfoModel);
              }

              if (activeIndex == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PaypalWebview(
                        amount: (amount).toInt().toString(),
                      );
                    },
                  ),
                );
              }
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue',
          ),
        );
      },
    );
  }
}
