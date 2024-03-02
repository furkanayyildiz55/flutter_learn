import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Text("a" * 2000),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text("A" * 10),
          ),
          Container(
              child: Text("aa" * 10),
              width: 50,
              //color: Colors.red, //decoration kullanımlarında buradaki color decoration tarafından ezilir
              constraints: const BoxConstraints(
                  maxWidth: 150, minWidth: 50, maxHeight: 150),
              padding: const EdgeInsets.all(15), //içeriye boşluk ekler
              margin: const EdgeInsets.all(20), //dışarıya boşluk ekler
              decoration: ProjectConainerDecoraiton())
        ],
      ),
    );
  }
}

//İki yönrem ile decoration sabitlerimi tutabilirim
//1
//Decoration özelliklerini sınıfa aktardık,
//
class ProjectConainerDecoraiton extends BoxDecoration {
  ProjectConainerDecoraiton()
      : super(
            gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
            //shape: BoxShape.circle, Daire şeklini almasını sağlar
            border: Border.all(color: Colors.white, width: 1), // kenarlık ekler
            borderRadius: BorderRadius.circular(10), //kenarları yuvarlatır
            boxShadow: const [
              // gölgeli kenarlık ekler
              BoxShadow(
                  color: Colors.yellow, offset: Offset(0.1, 1), blurRadius: 10)
            ]);
}

//2
//Statik mantığı ile
class ProjectUtility {
  static BoxDecoration ContainerDecoration = BoxDecoration(
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      //shape: BoxShape.circle, Daire şeklini almasını sağlar
      border: Border.all(color: Colors.white, width: 1), // kenarlık ekler
      borderRadius: BorderRadius.circular(10), //kenarları yuvarlatır
      boxShadow: const [
        // gölgeli kenarlık ekler
        BoxShadow(color: Colors.white, offset: Offset(0.1, 1), blurRadius: 10)
      ]);
}
