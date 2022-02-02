import 'package:flutter/material.dart';
import 'package:mobile_dev_hw2/alert_imc.dart';
import 'package:mobile_dev_hw2/form_input.dart';
import 'package:mobile_dev_hw2/gender.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool? _gender;
  late TextEditingController _height;
  late TextEditingController _weight;

  void setGender(bool? gender) {
    setState(() {
      _gender = gender;
    });
  }

  @override
  void initState() {
    super.initState();
    _height = TextEditingController();
    _weight = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _height.dispose();
    _weight.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular IMC'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _height.clear();
                _weight.clear();
                setGender(null);
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Text("Ingrese sus datos para calcular el IMC"),
          ),
          GenderPick(gender: _gender, setGender: setGender),
          NumericInput(
            iconData: Icons.square_foot,
            controller: _height,
            label: "Ingresar altura (metros)",
          ),
          NumericInput(
            iconData: Icons.monitor_weight,
            controller: _weight,
            label: "Ingresar peso (Kg)",
          ),
          ElevatedButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertIMC(
                          heightText: _height.text,
                          weightText: _weight.text,
                          gender: _gender);
                    });
              },
              child: const Text("Calcular"))
        ]),
      ),
    );
  }
}
