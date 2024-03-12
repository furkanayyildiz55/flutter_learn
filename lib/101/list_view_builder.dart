import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.white,
          );
        },
        itemBuilder: (context, index) {
          debugPrint("Listview Elemanı $index");
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    "https://picsum.photos/200",
                  ),
                ),
                Text("$index")
              ],
            ),
          );
        },
      ),
    );
  }
}


//! Builder method sadece görünen alanı çizmektedir

//! sepereted list view her çizimin arasına seperatad'da verilem widgeti ekler.

//! Listview gözüken elemanını kadar çizim yapar dedik , eğer gözükenden çok fazla elemanı 
//! çiziyor ise listview elemanlarının height değerleri kesin olarak belirlenmeli 
//! bu sized box ile de gerçekleştirilebilir


//! EXPANDED 
// bu widget özellikle coulmn,row veya list videget gibi widgetlerin elemanlarının 
//verilen alana sığmaması gibi durumlarda kullanılır. Sığmayan eleman EXpanded ile 
//sarmalanarak hata vermesi engellenir ve sığdırılır.