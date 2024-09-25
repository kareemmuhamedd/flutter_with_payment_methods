import 'package:dartz/dartz.dart';
import 'package:flutter_paypal_stripe/core/errors/failures.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
