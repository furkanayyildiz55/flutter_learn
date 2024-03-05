import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Custom Component"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomFoodButton(
                title: "Food",
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: CustomFoodButton(
                title: "Food",
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}

class ColorUtility {
  static const Color redColor = Colors.red;
  static const Color whiteColor = Colors.white;
}

class PaddingUtility {
  static const EdgeInsets padding1x = EdgeInsets.all(10);
}

//! Oluşturduğumuz custom componentimiz
//!! En önemlisi de oluşturuken sadece ana hatların custom comp. da olması
//!!! Padding, margin gibi özellikler sabit eklenmez

class CustomFoodButton extends StatelessWidget {
  const CustomFoodButton(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtility.redColor, shape: const StadiumBorder()),
      child: Padding(
        padding: PaddingUtility.padding1x,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: ColorUtility.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
