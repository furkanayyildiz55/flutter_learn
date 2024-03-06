import 'package:flutter/material.dart';
import 'package:flutter_learn/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned.fill(bottom: 25, child: RandomImage()),
                  Positioned(
                      height: 50, bottom: 0, width: 250, child: _cardCustom())
                ],
              )),
          const Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }

  Card _cardCustom() {
    return const Card(
      color: Colors.white,
    );
  }
}
