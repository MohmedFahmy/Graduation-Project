
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required dynamic paymentIntentInputModel});
}
