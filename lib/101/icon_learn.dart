import 'package:flutter/material.dart';

//* https://fonts.google.com/icons bize verilen material iconlar

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});

  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.outlined_flag_outlined,
              color: iconColors.blueDart,
              size: iconSizes.iconSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 48;
}

//https://colornamer.robertcooper.me/
//! Renkler isimlendirilir ve sabit olarak saklanır
class IconColors {
  final Color blueDart = const Color(0xff5196db);
}
