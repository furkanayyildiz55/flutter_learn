import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        //! ListView kendi paddingi bulunmaktadır, duruma göre bu padding silinebilir
        padding: EdgeInsets.zero,
        children: [
          FittedBox(
            child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.white, width: 100),
                Container(color: Colors.red, width: 100),
                Container(color: Colors.white, width: 100),
                Container(color: Colors.red, width: 100),
                Container(color: Colors.white, width: 100),
                Container(color: Colors.red, width: 100),
                Container(color: Colors.white, width: 100),
                Container(color: Colors.red, width: 100),
              ],
            ),
          ),
          const Divider(),
          Container(
            color: Colors.blue,
            height: 500,
          ),
          const _ListDemo(),
        ],
      ),
    );
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo();

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    debugPrint(("_LİstDemo widget çağrıldı"));
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("_LİstDemo widget sonlandı");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


//!Listview kaydırıldıkça ekranı çizer 
//! istenen videget ekrandan çıkınca siler ve geri gelince tekrardan çizer.

//* Bu nedenle değer yönetimi olan ListView larda değerleri sıfırlamak gibi argümanlar unutulmamalıdır.