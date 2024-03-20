import 'package:flutter/material.dart';
import 'package:flutter_learn/101/icon_learn.dart';
import 'package:flutter_learn/101/image_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
//! Tab controller sayfalar arası geçişi kolaylaştırmak için geçişler sağlamaktadır
//! Constructor veya init state anında initialize edilir
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    //*Tab controller initialize içindir
    //*vsync için with TickerProviderStateMixin sınıfa eklenmiş olmalıdır
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        appBar: _AppBarTab(),
        bottomNavigationBar: _BottomAppBarTab(),
        body: _TabBar(),
      ),
    );
  }

  TabBarView _TabBar() {
    return TabBarView(
      //!Bu özellik ile sürükleyerek sayfa değişimi kapatılıyor
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        const ImageLearn(),
        IconLearnView(),
        const ImageLearn(),
        IconLearnView()
      ],
    );
  }

  BottomAppBar _BottomAppBarTab() {
    return BottomAppBar(
      //* BottomAppBar ile floating action button arasındaki ayrımın kaç piksel olacağı
      notchMargin: 5,
      shape: const CircularNotchedRectangle(),
      child: TabBar(
        indicatorColor: Colors.amber,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.cyanAccent,
        //!Logic yazılabilir bir alan
        onTap: (value) {
          print("Tıklanılan Sayfa $value");
        },
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: e.name,
                ))
            .toList(),
      ),
    );
  }

  AppBar _AppBarTab() {
    return AppBar(
      bottom: TabBar(controller: _tabController, tabs: const [
        Tab(child: Text("Page1")),
        Tab(child: Text("Page2")),
        Tab(child: Text("Page1")),
        Tab(child: Text("Page2")),
      ]),
    );
  }
}

enum _MyTabViews { home, settings, upload, favorite }

extension _MyTabViewExtesion on _MyTabViews {}

//* Tab bar an sayfanımızın yanına diğer sayfaları ekleyen widget türüdür
//!Tab bar ile başlayacak viewlar default tab controller ile başlamalı

//Eğer sayfaları ve hangi sayfada olduğumuzu app barda göstermek isyiyorsak kurgulanması gereken yapı aşağıdaki gibidir
/* AppBar(
          bottom: const TabBar(tabs: [
            Tab(child: Text("Page1")),
            Tab(child: Text("Page2")),
          ]),
        ), */

//Eğer sayfaları ve hangi sayfada olduğumuzu bottom barda göstermek isyiyorsak kurgulanması gereken yapı aşağıdaki gibidir
/*bottomNavigationBar: const BottomAppBar(
          child: TabBar(tabs: [
            Tab(child: Text("Page1")),
            Tab(child: Text("Page2")),
          ]),
        ), */

//! TabBar teması yine Theme üzerinden verilebilir
