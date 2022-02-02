import 'package:flutter/material.dart';

class AlertIMC extends StatelessWidget {
  final String heightText;
  final String weightText;
  final bool? gender;
  const AlertIMC({
    Key? key,
    required this.heightText,
    required this.weightText,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = "";
    String content = "";
    if (heightText == "" || weightText == "" || gender == null) {
      title = "Completa los campos";
      content = "Necesitamos tu información completa";
    } else {
      double height = double.parse(heightText);
      double weight = double.parse(weightText);
      double imc = weight / (height * height);
      String imcText = imc.toStringAsPrecision(4);
      title = "Tu IMC es $imcText";
      // Here, gender is always not null but flutter is dumb and wants me to
      // check anyway.
      content = (gender ?? false)
          ? "Tabla de IMC para mujeres\n"
              "\n16-24     19-24\n"
              "25-34     20-25\n"
              "35-44     21-26\n"
              "45-54     22-27\n"
              "55-64     23-28\n"
              "65-90     25-30\n"
          : "Tabla de IMC para hombres"
              "\n16-24     19-24\n"
              "25-34     20-25\n"
              "35-44     21-26\n"
              "45-54     22-27\n"
              "55-64     23-28\n"
              "65-90     25-30\n";
    }

    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Aceptar"))
      ],
    );
  }
}
