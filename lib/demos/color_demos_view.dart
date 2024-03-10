// Ekranda  buton ve basınca renk değişimi

import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
