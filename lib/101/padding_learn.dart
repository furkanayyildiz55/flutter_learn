import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.cyan,
        child: Column(
          children: [
            Padding(
              padding: projectPadding.pagePadding,
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Container(
              color: Colors.white,
              height: 100,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}

//! padding: EdgeInsets.zero, bazı komponentlerde hali hazırda olan padding silmek için kullanılır

class projectPadding {
  static const pagePadding = EdgeInsets.all(10);
}
