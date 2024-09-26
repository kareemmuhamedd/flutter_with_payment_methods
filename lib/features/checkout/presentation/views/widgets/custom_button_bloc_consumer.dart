import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/models/payment_intent_input_model.dart';
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
          Navigator.of(context).pop();
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
          onTap: () {
            BlocProvider.of<PaymentCubit>(context).makePayment(
              paymentIntentInputModel: PaymentIntentInputModel(
                amount: '15000',
                currency: 'EGP',
                // i must get this customer id from the create customer post request to stripe api
                // but for fast testing i get this id from postman and i will use it here
                // you can get this id from the response of the create customer post request and this request should be in the sign up process if you work in real application
                customerId: 'cus_QuvtXaPwVI7pfa',
              ),
            );
          },
          text: 'Continue',
        );
      },
    );
  }
}
