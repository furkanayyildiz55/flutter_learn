import 'package:flutter_learn/202/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test(
      'Sample Test',
      () => () {
            final users = [
              GenricUser("Fk", "1", 10),
              GenricUser("Fk", "2", 10),
              GenricUser("Fk", "3", 0),
              GenricUser("Fk", "4", 50),
            ];

            final result = UserManagement().calculateMoney(users);
            expect(result, 70);
          });
}


//Test doslayarının isimlndirmesinin sonu test ile bitmeli