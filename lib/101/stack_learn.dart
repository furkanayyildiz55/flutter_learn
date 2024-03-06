import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.green,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 15,
            height: 100,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          //içerisindeki widgete olabilecek tüm alanı verir ve sadece yönlendirme yapar
          Positioned.fill(
              top: 50,
              left: 50,
              bottom: 50,
              child: Container(
                color: Colors.purple,
              ))
        ],
      ),
    );
  }
}

//! Stack üst üste binen widget durumlarında kullanılır

//* Children alır ve son verilen property her zaman önde olur

//! Positioned ise Stack içerisinde en verimli olan widget tir 
//! Tam olarak nerede durması gerektiği belirtilebilir
//! right,left,top,bottom,height,widht özellikleri ile kontrol edilebilir (en az üç tanesi anlamlılık kazandırır)

//! Bütün stack en fazla üstteki komponent kadar yer kaplar. Alttaki komponentler üsttekinin dışına çıkamaz 