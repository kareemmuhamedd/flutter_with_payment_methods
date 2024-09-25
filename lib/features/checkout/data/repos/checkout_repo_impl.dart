import 'package:dartz/dartz.dart';
import 'package:flutter_paypal_stripe/core/errors/failures.dart';
import 'package:flutter_paypal_stripe/core/utils/stripe_service.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
