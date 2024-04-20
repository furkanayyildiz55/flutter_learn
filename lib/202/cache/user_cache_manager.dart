import 'dart:convert';

import 'package:flutter_learn/202/cache/shared_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(final List<User> Useritems) async {
    final itemsEncode =
        Useritems.map((element) => jsonEncode(element.toJson())).toList();
    return await sharedManager.saveStringItems(SharedKeys.users, itemsEncode);
  }

  List<User>? getItems() {
    final List<String>? itemsString =
        sharedManager.getStringItems(SharedKeys.users);

    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User("as", "asd", "asd");
      }).toList();
    }
    return null;
  }
}
