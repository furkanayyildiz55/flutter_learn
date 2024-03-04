import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //* Container yerine kullanılabilecek güzel UI için hazırlanmış widget
          const Card(
            //! Dıştan boşluk için margin özelliğini barındırır
            margin: PrrojectMargins.cardMargin,
            color: Colors.white,
            //kenarları yarım daire olan ortası düz olan dikdörtgen şekil oluşturulabilir
            shape: StadiumBorder(),
            child: SizedBox(
              height: 100,
              width: 450,
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.error,
            shape: const CircleBorder(),
            child: const SizedBox(
              height: 200,
              width: 400,
            ),
          ),
          _CustomCard(
            childWidget: const Text("Test "),
          )
        ],
      ),
    );
  }
}

//! CUSTOM CARD İLE ÖZEL DIŞARIDAN WİDGET ALAN WİDGET TASARLANABİLİR
class _CustomCard extends StatelessWidget {
  final Widget childWidget;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  _CustomCard({required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onSecondary,
      shape: roundedRectangleBorder,
      child: SizedBox(
        height: 200,
        width: 400,
        child: Center(
          child: childWidget,
        ),
      ),
    );
  }
}

class PrrojectMargins {
  static const cardMargin = EdgeInsets.all(10);
}



//! Border Türleri
// StadiumBorder
// Circle Border          //* Direk olarak yuvarlak bir alan oluşturur
// RoundedRectangleBorder //* kenarları yuvarlatırmış ve özelleştirilebilir