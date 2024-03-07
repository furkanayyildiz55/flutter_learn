import 'package:flutter/material.dart';

class StatefullifeCycleLearn extends StatefulWidget {
  const StatefullifeCycleLearn({super.key, required this.message});
  //bu clasttaki her şey umutable(final) olmalı bir yerden etkilenemez ve değişemez.
  final String message;

  @override
  State<StatefullifeCycleLearn> createState() => _StatefullifeCycleLearnState();
}

class _StatefullifeCycleLearnState extends State<StatefullifeCycleLearn> {
  String _message = "";
  //* late anahtar kelimesi ile final olan değişlenin initilizesi sonradan olacak diyoruz
  late final bool _isOdd;

  //! İnit state bittikten sonra build metodu çalışmaktadır
  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = _message.length.isOdd;
    _CopmuteName();
  }

//! Başka bir sayfaya geçişte çağırılan metoddur
//* Navigation işlemlerinde geri gelinen sayfadaki içi dolu olan değişkenler sorun
//* yaratabilir, o nedenle genellikle nesne öldürülür. GarbColl....
  @override
  void dispose() {
    super.dispose();
    _message = "";
  }

  void _CopmuteName() {
    if (_isOdd) {
      _message = "Çift";
    } else {
      _message = "Tek";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text("$_message  sa")),
    );
  }
}
