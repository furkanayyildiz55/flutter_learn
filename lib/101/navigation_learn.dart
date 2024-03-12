import 'package:flutter/material.dart';
import 'package:flutter_learn/101/navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>
    with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              final response = await navigateToWidgetNormal<bool>(
                  context,
                  NavigateDetailLearn(
                    isOkey: selectedItems.contains(index),
                  ));

              if (response is bool) {
                addSelected(index, response);
              }
            },
            child: Placeholder(
              color: selectedItems.contains(index) ? Colors.blue : Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.navigation_rounded),
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }
}

//! Mixin constructoru olmayan classdır. 
//* ve kullanılmak istenen sınıfa with ifadesi ile eklenir böylelikle mixin aynı nesnesi oluşturulmuş classlar gibi davranır
//* fakat nesne ismine gerek kalmadan metotlar direkt gelmektedir


//! fullscreenDialog farklı bir yönlendirmedir, geri butonu yerine çarpı butonu çıkar. Daha çok ilerlemeyen sayfalarda kullanılır gibi
//fullscreenDialog: true)


//! navigateToWidgetNormal fonksiyonu ile de başka sayfaya yönlendirme yapılabilir 
//* fakat bu yönlendirmede gidilen sayfadan T türünde veri dönüşü gerçekleşir ve 
//* bu return yardımı ile bu dönüşü alıp işleyebiliriz

//! gidilen sayfdan da pop içerisine dönmek istediğimiz veriyi veriyoruz