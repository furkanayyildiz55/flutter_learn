import 'package:flutter/material.dart';

class CoulmnRowLearn extends StatelessWidget {
  const CoulmnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(flex: 4, child: Container(color: Colors.red)),
            Expanded(flex: 2, child: Container(color: Colors.white)),
            const Spacer(
              flex: 2,
            ),
            Expanded(flex: 2, child: Container(color: Colors.green)),
          ],
        ));
  }
}

//! Expanded widget ile coulmn ve rowlarda eşit bölümlendirme gerçekleştirilebilir
//* Spacer ise child özelliği olmayan Expanded gibi düşünülebilir


//! MainAxisSize özelliği widgetin ne kadar yer kaplayaxağı ile ilgilidir
//! Default değeri MAX dır MIN yapılırsa en az yeri kaplamaya çalışır