import 'package:flutter/material.dart';

part 'part_appbar.dart';
//Part olayının mantığı başka bir dosyadaki private değerlere erişebilmektedir
//Bu kapsamda ana dosya diğer dosyayı referans alırken
//Erişimin gerçekleşeceği dosya ise part of ile ana dosyaya referans eklenir

//! Ana dosyadaki importlar part of dosyasına gelir

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({super.key});

  @override
  State<PartOfLearn> createState() => _PartOfLearnState();
}

class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PartOfAppBar(),
    );
  }
}
