import 'package:flutter/material.dart';

class NumericInput extends StatelessWidget {
  final IconData iconData;
  final TextEditingController controller;
  final String label;

  const NumericInput({
    Key? key,
    required this.iconData,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
            icon: Icon(iconData),
            border: const OutlineInputBorder(),
            labelText: label),
        controller: controller,
        keyboardType:
            const TextInputType.numberWithOptions(signed: false, decimal: true),
      ),
    );
  }
}
