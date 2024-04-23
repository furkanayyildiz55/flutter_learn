import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedContextLearn extends StatefulWidget {
  const SharedContextLearn({super.key});

  @override
  State<SharedContextLearn> createState() => _SharedContextLearnState();
}

class _SharedContextLearnState extends State<SharedContextLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = "";

  void SaveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  void getSecureItems() async {
    _title = await _storage.read(key: SecureKeys.token.name) ?? "";
    setState(() {});

    if (_title.isEmpty) {
      print("Bu uygulama bu telefona daha önceden yüklemiştir. ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _storage.write(key: SecureKeys.token.name, value: _title);
        },
        child: const Text("Save"),
      ),
      body: TextField(
        onChanged: SaveItems,
      ),
    );
  }
}

enum SecureKeys { token }
