import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe/core/utils/constants_pathes/image_paths.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/payment_details_screen.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/widgets/payment_methodes_list_view.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/widgets/total_price_widget.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import 'cart_info_item.dart';

class MyCartScreenBody extends StatelessWidget {
  const MyCartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset(ImagePaths.basketImage)),
          const SizedBox(height: 25),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'$15.23',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Discount',
            value: r'$3',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'$2.8',
          ),
          const Divider(
            height: 34,
            thickness: 2,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.79',
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const PaymentDetailsScreen(),
              //   ),
              // );
              showModalBottomSheet(
                context: context,
                builder: (context) => const PaymentMethodsBottomSheet(),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              );
            },
            text: 'Complete Payment',
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onTap: () {},
            text: 'Continue',
          ),
        ],
      ),
    );
  }
}
