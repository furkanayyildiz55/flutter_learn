import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  //Değeri sonradan constructor ile erilecek ve daha değişmeyecek anlamını taşır
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      CollectionModel(
          imagePath: "assets/png/demo_image.png",
          title: "Abstact Arts ",
          price: 3.99),
      CollectionModel(
          imagePath: "assets/png/demo_image.png",
          title: "Abstact Arts 2 ",
          price: 5.99),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 35),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    _model.imagePath,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_model.title),
                    Text(_model.title),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

//! ASLINDA PADDİNGLER HEPSİNİN BURADA SABİT OLARAK TUTULMASI GEREKMEKTEDİR


//ERİŞİM BELİRTEÇLERİ 
// late  : değeri sonradan belirlenecek 
// final : değeri belirlendikten sonra daha değişmeyen 


