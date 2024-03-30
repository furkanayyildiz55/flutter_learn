import 'package:flutter/material.dart';
import 'package:flutter_learn/202/model_learn.dart';

class ModelLearnWiev extends StatefulWidget {
  const ModelLearnWiev({super.key});

  @override
  State<ModelLearnWiev> createState() => _ModelLearnWievState();
}

class _ModelLearnWievState extends State<ModelLearnWiev> {
  //Değişkeni var olarak eklediğimizde değişiklik gerektiği durumlarda yeni bir nesne atayarak değişiklik yapılabilir
  //*İçerisindeki propertyler final oladuğunda tek tek değişiklik yapılamaz
  var user9 = PostModel8(body: "Abc User8");

  @override
  void initState() {
    super.initState();
    final user1 = PostModel1()
      ..body = "User1"
      ..id = 1;
    user1.title = "Test";

    final user2 = PostModel2(1, 1, "title", "body");
    user2.body = "abc";

    final user3 = PostModel3(1, 1, "title", "body");
    //user3.body = "Final ikinci atama sağlanamaz ";

    final user4 = PostModel4(userId: 1, id: 1, title: "title", body: "body");
    //user4.body = "Final ikinci atama sağlanamaz ";

    final user5 = PostModel5(userId: 1, id: 1, title: "title", body: "body");
    user5.GetUserId;

    final user7 = PostModel7();
    final user8 = PostModel8(body: "Abc User8");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user9.title ?? "Veri bulunamadı."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: "Veri Değişti");
            user9.updateBody("Body Güncellenecek");
          });
        },
      ),
    );
  }
}
