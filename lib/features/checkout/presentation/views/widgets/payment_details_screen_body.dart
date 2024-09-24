import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe/core/utils/widgets/custom_button.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/thank_you_screen.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/widgets/payment_methodes_list_view.dart';

import 'custom_credit_card.dart';

class PaymentDetailsScreenBody extends StatefulWidget {
  const PaymentDetailsScreenBody({super.key});

  @override
  State<PaymentDetailsScreenBody> createState() =>
      _PaymentDetailsScreenBodyState();
}

class _PaymentDetailsScreenBodyState extends State<PaymentDetailsScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formKey,
            autoValidateMode: autoValidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ThankYouScreen(),
                      ),
                    );
                  }
                },
                text: 'Pay Now',
              ),
            ),
          ),
        )
      ],
    );
  }
}
