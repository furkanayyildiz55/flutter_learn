import 'package:flutter/material.dart';
import 'package:flutter_learn/202/packege/launch_mixin.dart';
import 'package:flutter_learn/202/packege/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoadingBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send_and_archive_rounded, size: 35),
        onPressed: () {
          launchURL(Uri.parse("https://flutter.dev"));
        },
      ),
    );
  }
}
