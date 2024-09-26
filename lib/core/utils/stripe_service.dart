import 'package:dio/dio.dart';
import 'package:flutter_paypal_stripe/core/utils/api_keys.dart';
import 'package:flutter_paypal_stripe/core/utils/api_service.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/models/ephemeral_response_model/ephemeral_response_model.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/checkout/data/models/init_payment_sheet_input_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  // lets create payment intent method - the first step is to create a payment process -
  // this method will return a payment intent model
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<EphemeralResponseModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
        body: {
          'customer': customerId,
        },
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Stripe-Version': '2024-06-20',
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
        });

    var ephemeralResponseModel = EphemeralResponseModel.fromJson(response.data);
    return ephemeralResponseModel;
  }

  // the next step is to initialize the payment sheet
  // this method required two important parameters - paymentIntentClientSecret and merchantDisplayName
  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        merchantDisplayName: 'kartech',
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
      ),
    );
  }

  // the last step is to display the payment sheet
  // this method will display the payment sheet to the user
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // this method will call the three methods above
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralResponseModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralResponseModel.secret!,
    );

    await initPaymentSheet(initPaymentSheetInputModel: initPaymentSheetModel);
    await displayPaymentSheet();
  }
}
