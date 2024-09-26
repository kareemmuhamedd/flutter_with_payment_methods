import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/widgets/my_cart_screen_body.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const MyCartScreenBody(),
    );
  }
}
