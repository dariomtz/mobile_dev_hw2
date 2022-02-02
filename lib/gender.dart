import 'package:flutter/material.dart';

class GenderPick extends StatelessWidget {
  final bool gender;
  final Function setGender;
  const GenderPick({
    Key? key,
    required this.gender,
    required this.setGender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setGender(true);
          },
          icon: const Icon(Icons.female),
          color: gender ? Colors.green : Colors.grey,
          iconSize: 35,
        ),
        IconButton(
          onPressed: () {
            setGender(false);
          },
          icon: const Icon(Icons.male),
          color: !gender ? Colors.green : Colors.grey,
          iconSize: 35,
        ),
      ],
    );
  }
}
