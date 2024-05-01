class UserManagement {
  void sayName(GenricUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenricUser> users) {
    final sumMoney = users
        .map((e) => e.money)
        .fold<int>(0, (previousValue, element) => previousValue + element);

    final sumMoney2 = users.fold<int>(
        0, (previousValue, element) => previousValue + element.money);

    print(sumMoney);

    return sumMoney;
  }
}

class GenricUser {
  final String name;
  final String id;
  final int money;

  GenricUser(this.name, this.id, this.money);
}
