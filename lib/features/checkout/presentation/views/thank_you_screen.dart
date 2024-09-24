import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/widgets/thank_you_screen_body.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onTap: () {
        Navigator.pop(context);
      }),
      backgroundColor: Colors.white,
      body: const ThankYouScreenBody(),
    );
  }
}
