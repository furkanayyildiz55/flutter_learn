import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearn extends StatelessWidget {
  const AppBarLearn({super.key});

  final String _titleText = "Title Text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
        //AppBar title alanının sol tarafına wigdet eklemeye yarar
        leading: const Icon(Icons.backspace_rounded),
        leadingWidth: 55,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.mark_email_read)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.access_alarms_sharp)),
        ],
        actionsIconTheme: const IconThemeData(color: Colors.green),
        // arka planı transparan yaparak ve elevation 0 yaparak app bar sayfa ile bütünleşir
        backgroundColor: Colors.transparent,
        elevation: 0,
        //Telefonun en üst kısmındaki kulanıcı bilgilerini ayarlar
        systemOverlayStyle: SystemUiOverlayStyle.light,
        //Ototmatik olarak gelen geri butonunu kapatma
        automaticallyImplyLeading: false,
      ),
    );
  }
}
