import 'package:flutter_paypal_stripe/core/utils/api_keys.dart';
import 'package:flutter_paypal_stripe/core/utils/api_service.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  // lets create payment intent method - the first step is to create a payment process -
  // this method will return a payment intent model
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.sekretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  // the next step is to initialize the payment sheet
  // this method required two important parameters - paymentIntentClientSecret and merchantDisplayName
  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'kartech',
      ),
    );
  }

  // the last step is to display the payment sheet
  // this method will display the payment sheet to the user
  Future displayPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }

  // this method will call the three methods above
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
