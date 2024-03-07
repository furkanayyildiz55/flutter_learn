import 'package:flutter/material.dart';
import 'package:flutter_learn/101/image_learn.dart';
import 'package:flutter_learn/101/stack_learn.dart';
import 'package:flutter_learn/101/text_learn_view.dart';
import 'package:flutter_learn/demos/stack_demo_view.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController();
  int _currentPageIndex = 1;

  void _pageChanged(value) {
    setState(() {
      _currentPageIndex = value + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: _DurationUtility._durationLow, curve: Curves.ease);
            },
            child: const Icon(Icons.chevron_left),
          ),
          Text(_currentPageIndex.toString()),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: _DurationUtility._durationLow, curve: Curves.ease);
            },
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
      body: PageView(
        //* Ana Sayfayı küçültür ve diğer sayfaların önizlemesini gösterir
        //controller: PageController(viewportFraction: 0.8),
        onPageChanged: _pageChanged,
        controller: _pageController,
        children: [
          const ImageLearn(),
          const StackDemoView(),
          TextLearnView(),
          const StackLearn(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

//! PageView bize kaydırılabilir içerisinde birden fazla sayfa veya yapı bulunudurulabilir bir yapı sunar

class _DurationUtility {
  static const _durationLow = Duration(milliseconds: 400);
}
