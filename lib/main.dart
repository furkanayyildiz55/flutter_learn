import 'package:flutter/material.dart';
import 'package:flutter_learn/202/alert_learn.dart';
import 'package:flutter_learn/202/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: LightTheme().theme,

        // ThemeData.dark().copyWith(
        //   progressIndicatorTheme: const ProgressIndicatorThemeData(
        //     color: Colors.white,
        //   ),
        //   appBarTheme: const AppBarTheme(
        //     centerTitle: true,
        //     systemOverlayStyle: SystemUiOverlayStyle.light,
        //     backgroundColor: Colors.black,
        //     elevation: 0,
        //   ),
        //   inputDecorationTheme: const InputDecorationTheme(
        //     filled: true,
        //     // fillColor: Colors.white,
        //     iconColor: Colors.amber,
        //     border: OutlineInputBorder(),
        //   ),
        //   tabBarTheme: const TabBarTheme(indicatorColor: Colors.pinkAccent),
        //   bottomAppBarTheme: const BottomAppBarTheme(
        //     shape: CircularNotchedRectangle(),
        //   ),
        // ),
        home: const AlertLearn());
  }
}

//Material App, Theme içerisine copy with ekleyerek bundan sonraki tüm sayfaların temalarını ve özelliklerini 
//buradan ayarlayabiliriz
/*
MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.red,
          elevation: 0,
        ),
      ),
      home: const AppBarLearn(),
    );
*/