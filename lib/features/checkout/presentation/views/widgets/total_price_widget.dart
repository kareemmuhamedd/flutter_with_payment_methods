import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';


class TotalPrice extends StatelessWidget {
  final String title, value;

  const TotalPrice({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style24,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.style24,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
