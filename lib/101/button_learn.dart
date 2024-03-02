import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Buttons"),
          ),
          //onPressed olayına null vererek buton aktifliği kapatılabilir
          const TextButton(onPressed: null, child: Text("Null Buttons")),
          ElevatedButton(onPressed: () {}, child: const Text("Buttons")),
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.plus_one_sharp),
          ),
          OutlinedButton(onPressed: () {}, child: const Text("Button")),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
              label: const Text("Icon Btn")),
          //Custom button oluşturmak için
          InkWell(
            onTap: () {},
            child: const Text("Inkvell"),
          ),

          //Button style için aşırı custom özellik
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.yellow;
                }

                return Colors.cyanAccent;
              }),
            ),
            child: const Text("Buttons"),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
              child: Text("Pleace Bid"),
            ),
          ),
        ],
      ),
    );
  }
}
