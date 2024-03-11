// Ekranda  buton ve basınca renk değişimi

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({super.key, required this.initialColor});
  final Color? initialColor;

  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? bacgroundColor = Colors.white;

  void changeBacgroundColor(Color color) {
    setState(() {
      bacgroundColor = color;
    });
  }

  @override
  void initState() {
    changeBacgroundColor(widget.initialColor ?? Colors.transparent);
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    inspect(widget);
    if (widget.initialColor != bacgroundColor && widget.initialColor != null) {
      changeBacgroundColor(widget.initialColor!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alt Widget"),
      ),
      backgroundColor: bacgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: [
        _bottomNavItem(Colors.red, "Red"),
        _bottomNavItem(Colors.yellow, "Yellow"),
        _bottomNavItem(Colors.blue, "Blue"),
      ]),
    );
  }

  //! Metodlarda her zaman dönüş tipi ve parametre veri türü belirtilmelidir !!!
  void _colorOnTap(int value) {
    if (value == myBackroundColors.red.index) {
      changeBacgroundColor(Colors.red);
    } else if (value == myBackroundColors.yellow.index) {
      changeBacgroundColor(Colors.yellow);
    } else {
      changeBacgroundColor(Colors.blue);
    }
  }

  BottomNavigationBarItem _bottomNavItem(Color color, String label) {
    return BottomNavigationBarItem(
        icon: Container(
          width: 10,
          height: 10,
          color: color,
        ),
        label: label);
  }
}

enum myBackroundColors { red, yellow, blue }



//! inspect bizim için debugta kolaylık sağlar 
//! içine verilen videgeti açıklar