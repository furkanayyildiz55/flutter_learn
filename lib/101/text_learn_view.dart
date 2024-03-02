import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.surname});

  final String name = "Furkan";
  final String? surname;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            ("Welcome $name ${name.length}"),
            style: ProjectStyles.WelcomeStyle,
            overflow: TextOverflow
                .ellipsis, //metin taşmasını engellemek için kulanılır.. Sona ... ekler
            textAlign: TextAlign.right, //metnin hizalaması
          ),
          Text(
            ("Welcome $name ${name.length}"),
            style: Theme.of(context) //material typografi özellikleridir
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.amber),
            overflow: TextOverflow
                .ellipsis, //metin taşmasını engellemek için kulanılır.. Sona ... ekler
            textAlign: TextAlign.right, //metnin hizalaması
            maxLines: 2, //maksimum 2 satır yer kaplayacak
          ),
          //Text(surname!), // Force etme yöntemi hatalara sebep olabilir
          Text(surname ?? ""), //Nul gelme durumunu her zaman ele almalıyız
          Text(keys
              .welcomeKey) //Proje metinleri her zaman statik vs bir değişkende tutulmalı, el ile verilmemeli          ],
        ]),
      ),
    );
  }
}

//kendi stil dosyalarımızı oluşturabilir, fazla kod tekrarı ve sürdürülebilirlik kazanırız.
class ProjectStyles {
  static TextStyle WelcomeStyle = const TextStyle(
    color: Colors.blue,
    fontSize: 16,
    fontWeight: FontWeight.w600, //metin kalınlığı
    wordSpacing: 2, //kelimeler arası boşluk
    letterSpacing: 2, //harfler arası boşluk
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcomeKey = "Welcome";
}
