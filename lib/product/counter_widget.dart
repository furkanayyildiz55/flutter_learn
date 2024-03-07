import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _buttonValue = 0;
  final _buttonText = "Increment Button";

  void _updateIncrementer() {
    setState(() {
      _buttonValue++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _updateIncrementer,
        child: Text("$_buttonText  $_buttonValue"));
  }
}
