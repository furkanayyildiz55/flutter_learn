import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: DurationsItems.durationLow);
  }

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
      controller.animateTo(_isVisible ? 1 : 0);
    });
  }

  void _changeOpacity() {
    _isOpacity = !_isOpacity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _pleaceholderWidget()),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: DurationsItems.durationLow,
                opacity: _isOpacity ? 1 : 0,
                child: const Text("data")),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _changeOpacity();
                  });
                },
                icon: const Icon(Icons.track_changes)),
          ),
          AnimatedDefaultTextStyle(
            style: (_isVisible
                    ? context.textTheme().headlineMedium
                    : context.textTheme().displaySmall) ??
                const TextStyle(),
            duration: DurationsItems.durationLow,
            child: const Text("Text Widget"),
          ),
          AnimatedIcon(icon: AnimatedIcons.pause_play, progress: controller),
          const Divider(),
          AnimatedContainer(
            duration: DurationsItems.durationLow,
            height: _isVisible ? 50 : MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
          ),
          const Expanded(
            child: Stack(children: [
              AnimatedPositioned(
                top: 50,
                left: 50,
                duration: DurationsItems.durationLow,
                //default değeri var fakat buradan da değiştirilebilir
                curve: Curves.easeInCubic,
                child: Text("Animasyonluyum"),
              )
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
        },
      ),
    );
  }

  AnimatedCrossFade _pleaceholderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState:
          _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: DurationsItems.durationLow,
    );
  }
}

//Text("Veri", style: context.textTheme().bodyLarge)
extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class DurationsItems {
  static const Duration durationLow = Duration(milliseconds: 500);
}


//Animated Widgetler 

// 1 - AnimatedCrossFade -> içeirisine 2 widget alır ve bunlar arasında animasyonlu geçiş sağlar.

// 2 - AnimatedOpacity -> İçerisine tek bie widget alır ve bu widgetin opaklığını animayonlu değişimini sağlar.
// 1 tam görünürlük sağlarken 0 wigdeti görünmez kılar. 

// 3 - AnimatedDefaultTextStyle -> İçerisine verilen TextStyle lar arasında animasyonlu geçiş sağlar
                // style: (_isVisible
                //       ? context.textTheme().headlineMedium
                //       : context.textTheme().displaySmall) ??
                //   const TextStyle(),
//şeklinde verilen stil özellikleri arası geçiş sağlar 

// 4 - AnimatedIcon -> Kendi içerisinde default yazılmış icondan başka icona geçiş özellikleri vardır
//menu iconundan carpı iconuna geçiş gibi, 
//İçerisine controller alır ve duration gibi güçleri controllerdan sağlars

// 5 - AnimatedContainer -> Bu container içerisindeki tüm değişiklikleri animasyonlu bir şekilde gerçekleştirir
//child hariç, child içerisindekiler animasyonsuz olarak değişir.

// {required TickerProvider vsync} bir veri gitişi parametresi bu şekilde olduğunda bulunduğumuz sınıfa bazı özellikleri kazandırmamız Gerekir(),
// with TickerProviderStateMixin  implementi ile sınıfa özellikleri ekleriz
//AnimationController(vsync: this) ve this ifadesi ile ilgili alana geçebiliriz