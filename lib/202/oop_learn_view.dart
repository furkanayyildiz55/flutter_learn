import 'package:flutter/material.dart';
import 'package:flutter_learn/202/oop_learn.dart';

class OopLearnView extends StatefulWidget {
  const OopLearnView({super.key});

  @override
  State<OopLearnView> createState() => _OopLearnViewState();
}

class _OopLearnViewState extends State<OopLearnView> {
  FileDownload? download;

  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CircularProgressIndicator()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //download nesnesi null olabileceğinden null check yani ? ekliyoruz
          //böylelikle download nesnesi gerçekten null ise bu durumda diğer kodları çalıştırmıyor yani metodud çalıştırmıyor
          download?.donwloadItem(null);
        },
      ),
    );
  }
}
