import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatelessWidget {
  const NavigateDetailLearn({super.key, this.isOkey = false});
  final bool isOkey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(!isOkey);
            },
            icon: isOkey ? const Icon(Icons.cancel) : const Icon(Icons.check),
            label: isOkey ? const Text("Red") : const Text("Onayla")),
      ),
    );
  }
}

//! Pop içerisine geri döndürmek istediğimiz veriyi ekliyoruz