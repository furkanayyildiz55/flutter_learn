import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/shared_manager.dart';
import 'package:flutter_learn/202/cache/user_cache_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends State<SharedListCache> {
  late final UserCacheManager userCacheManager;
  late final SharedManager sharedManager;
  late final List<User> _users;

  @override
  void initState() {
    super.initState();
    sharedManager = SharedManager();
    sharedManager.init().whenComplete(
      () {
        userCacheManager = UserCacheManager(sharedManager);
      },
    );
    _users = userCacheManager.getItems() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                userCacheManager.saveItems(_users);
              },
              icon: const Icon(Icons.download_for_offline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
        ],
      ),
      body: _UserListView(userItem: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({required this.userItem});

  final List<User> userItem;

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
