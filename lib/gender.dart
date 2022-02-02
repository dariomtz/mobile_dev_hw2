import 'package:flutter/material.dart';

class GenderPick extends StatelessWidget {
  final bool? gender;
  final Function setGender;
  const GenderPick({
    Key? key,
    required this.gender,
    required this.setGender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool female = gender ?? false;
    // Again, there is no way gender can be null in the second option but dart
    // is dumb and wants me to check
    bool male = (gender == null) ? false : !(gender ?? false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setGender(true);
          },
          icon: const Icon(Icons.female),
          color: female ? Colors.green : Colors.grey,
          iconSize: 35,
        ),
        IconButton(
          onPressed: () {
            setGender(false);
          },
          icon: const Icon(Icons.male),
          color: male ? Colors.green : Colors.grey,
          iconSize: 35,
        ),
      ],
    );
  }
}
