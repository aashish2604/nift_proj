import 'package:flutter/material.dart';

class KeyValueCol extends StatelessWidget {
  final String keyName;
  final String valueName;
  final CrossAxisAlignment crossAxisAlignment;
  final TextStyle keyTextStyle;
  final TextStyle? valueTextStyle;
  const KeyValueCol(
      {super.key,
      required this.keyName,
      required this.valueName,
      this.crossAxisAlignment = CrossAxisAlignment.end,
      this.keyTextStyle = const TextStyle(
          fontWeight: FontWeight.w900,
          color: Color.fromARGB(255, 127, 127, 127)),
      this.valueTextStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          keyName,
          style: keyTextStyle,
        ),
        Text(
          valueName,
          style: valueTextStyle,
        ),
      ],
    );
  }
}
