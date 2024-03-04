import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/101/image_learn.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});

  final String title = "Create Your First Note";
  final String ButtonTitle = "Create A Note";
  final String TextButtonTitle = "İmports Note";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            const PngImage(name: "android"),
            _TitleWidget(title: title),
            const Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubtitleWidget(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: SizedBox(
                height: ButtonHeights.buttonHeight,
                child: Center(
                  child: Text(ButtonTitle,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(TextButtonTitle),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Add a note " * 12,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.black87, fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);

  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

class ButtonHeights {
  static const double buttonHeight = 50;
}
