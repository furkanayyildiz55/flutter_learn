import 'package:flutter/material.dart';

class StatefulLearn extends StatefulWidget {
  const StatefulLearn({super.key});

  @override
  State<StatefulLearn> createState() => _StatefulLearnState();
}

class _StatefulLearnState extends State<StatefulLearn> {
  int _countValue = 0;

  void updateIncrement({required bool isIncrement}) {
    if (isIncrement) {
      _countValue++;
    } else {
      _countValue--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(_countValue.toString())),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _incrementButton(),
          _deIncrementButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        updateIncrement(isIncrement: true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deIncrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          updateIncrement(isIncrement: false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}


//! Stateful widget içerisinde StatefulWidget tarafı sadece data alma işlevi görür
//! State tarafı ise hayat görevi görür ve çizimleri üstlenir ve logic işlemleri yapılır


//* Set state sayesinde build methodu tekrardan tetiklenmektedir
//* Sadece bu classta kullanılacak verileri _ ile private yapmayı unutmuyoruz !!!