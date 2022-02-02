import 'package:flutter/material.dart';
import 'package:mobile_dev_hw2/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calcular IMC'),
        ),
        body: Home(),
      ),
    );
  }
}
