import 'package:flutter/material.dart';
import 'package:flutter_paypal_stripe/features/checkout/presentation/views/widgets/payment_method_item.dart';

import '../../../../../core/utils/constants_pathes/icons_paths.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodItems = const [
    IconsPaths.visaCardIcon,
    IconsPaths.paypalIcon,
    IconsPaths.applePayIcon,
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: PaymentMethodItem(
                isSelected: activeIndex == index,
                icon: paymentMethodItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
