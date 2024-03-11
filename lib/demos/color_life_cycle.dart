import 'package:flutter/material.dart';
import 'package:flutter_learn/demos/color_demos_view.dart';

class ColorLifeCycleDemos extends StatefulWidget {
  const ColorLifeCycleDemos({super.key});

  @override
  State<ColorLifeCycleDemos> createState() => _ColorLifeCycleDemosState();
}

class _ColorLifeCycleDemosState extends State<ColorLifeCycleDemos> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Üst Widget"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _backgroundColor = Colors.pink;
                });
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
              child: ColorDemosView(
            initialColor: _backgroundColor,
          ))
        ],
      ),
    );
  }
}


//!!!!
// Alt sayfaya gönderilen veri nullable olabilir ve bu veriyi üst sayfa değil 
// her zaman alt sayfanın kendisi kontrol edip aksiyon almalı