
import 'package:dartz/dartz.dart';
import 'package:graduation_app/features/payment_getWay/Features/checkout/data/repos/checkout_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/stripe_service.dart';

class CheckoutRepoImple extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
