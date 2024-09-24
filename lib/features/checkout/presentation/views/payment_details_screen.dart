import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/widgets/payment_details_screen_body.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'Payment Details',
          onTap: () {
            Navigator.pop(context);
          }),
      body: const PaymentDetailsScreenBody(),
    );
  }
}
