import 'package:flutter/material.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: const Text("Scaffold Sample"),
        centerTitle: true,
      ),
      body: const Text("Text"),
      //Sayfa alt kısmında yönlendirme ilemi yapan butonlar ve text alanları gözüküyor
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.real_estate_agent_sharp), label: "1"),
        BottomNavigationBarItem(
            icon: Icon(Icons.real_estate_agent_sharp), label: "2"),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("A"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      //sayfa için menüleri gösteren alandır
      drawer: const Drawer(
        child: Center(child: Text("Ben Drawer")),
      ),
    );
  }
}
