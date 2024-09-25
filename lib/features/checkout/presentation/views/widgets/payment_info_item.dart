import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class PaymentInfoItem extends StatelessWidget {
  final String title;
  final String value;

  const PaymentInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style18Bold,
        ),
      ],
    );
  }
}
