import 'package:flutter/material.dart';

//! Stateless sayfalar statik sayfalardır
//* Bıild metodu bu widget için ekran çizim işini üstlenir ve override edilmesi gerekir

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const TitleTextWidget(text: "test1"),
          customSizedBox(),
          const TitleTextWidget(text: "test2"),
          const _CustomContainerWidget(),
        ],
      ),
    );
  }

//! Bazı basit componentler methot olarak da sınıf içerisinde tutulabilir

  SizedBox customSizedBox() => const SizedBox(height: 10);
}

//! Komlex olan yapılar ayrı ayrı widger sınıflarına ayrılmalı.
//! Ctrl + . ile seçilen widget te Extract Widget diyerek wigdet ayrı clasa alınabilir
//* "_" alt tre ile class private yapılabilir

class _CustomContainerWidget extends StatelessWidget {
  const _CustomContainerWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
