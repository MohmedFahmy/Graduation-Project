import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../data/models/payment_intent_inputmodel.dart';
import '../../../data/models/transaction_info_model.dart';
import '../../../data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required TransactionInfoModel transactionInfo,
  }) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (L) => emit(
        PaymentFailure(L.errMessage),
      ),
      (R) => emit(
        PaymentSuccess(transactionInfo),
      ),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(
      change.toString(),
    );
    super.onChange(change);
  }
}
