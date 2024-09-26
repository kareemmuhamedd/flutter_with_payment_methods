import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_paypal_stripe/features/checkout/data/repos/checkout_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CheckoutRepo checkoutRepo;

  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (l) => emit(PaymentFailure(l.errMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
