import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/thank_you_screen.dart';

import '../../../../../core/utils/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const ThankYouScreen();
              },
            ),
          );
        }
        if (state is PaymentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          onTap: () {},
          text: 'Continue',
        );
      },
    );
  }
}
