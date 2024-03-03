import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: ColorItems.sulu,
            child: const Text("Color Learn"),
          ),
          //! Color theme den de çekilebilir. Böylelikle farklı temalar arası geçiş kolay olur
          Container(
            color: Theme.of(context).primaryColor,
            child: const Text("Color Learn"),
          ),
        ],
      ),
    );
  }
}

class ColorItems {
  static const Color porchase = Color(0xffEDBF61);
  static const Color sulu = Color.fromRGBO(198, 237, 97, 1);
}
