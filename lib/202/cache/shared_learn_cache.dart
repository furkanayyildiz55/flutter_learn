import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/shared_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends SharedLearnModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const SizedBox.shrink())
        ],
        title: Text(_currentValue.toString()),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _changeValue(value);
            },
          ),
          Expanded(
            child: _UserListView(),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () async {
              _manager.saveString(SharedKeys.counter, _currentValue.toString());
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove_circle),
            onPressed: () async {
              bool remoceStatus = await _manager.remove(
                SharedKeys.counter,
              );
              print(remoceStatus == true ? "Silindi" : "Silinemedi");
            },
          ),
        ],
      ),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView();

  final List<User> userItem = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userItem.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              title: Text(userItem[index].name ?? ""),
              subtitle: Text(userItem[index].description ?? ""),
              trailing: Text(userItem[index].url ?? "")),
        );
      },
    );
  }
}

abstract class SharedLearnModel extends State<SharedLearn> {
  int _currentValue = 0;
  bool _isVisible = false;
  bool _isLoading = false;
  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _manager.init();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  void getDefaultValues() async {
    String? counter = _manager.getString(SharedKeys.counter);
    _changeValue(counter ?? "0");
    print(counter != null ? "Okundu : $counter" : "Okunamadı");
  }

  void changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _changeValue(String data) {
    final value = int.tryParse(data);
    if (value != null) {
      setState(() {
        _currentValue = value;
      });
    }
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User("Furkan", "furkan Ayyıldız", "furkanayyildiz.com"),
      User("fu", "fur", "furkan"),
      User("fu", "fur", "furkan"),
      User("fu", "fur", "furkan"),
    ];
  }
}
