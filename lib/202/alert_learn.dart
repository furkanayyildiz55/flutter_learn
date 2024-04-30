import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Learn"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // showAboutDialog(
          //     context: context,
          //     applicationName: "ssAss",
          //     applicationIcon: const Icon(Icons.sailing_rounded),
          //     children: [const Text("Data")]);

          final response = await showDialog(
              //boşluğa tıklayıp dialog penceresinin kapanmaması için
              //barrierDismissible: false,
              context: context,
              builder: (context) {
                return const ImageZoomDialog();
              });

          inspect(response);
        },
      ),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Version Update'),
      actions: [
        TextButton(
            onPressed: () {
              //Geriye cevap döndürür
              Navigator.pop(context, true);
            },
            child: const Text("Close")),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text("Update"),
        ),
      ],
    );
  }
}

class Keys {
  static const versionUpdate = "Version Update";
}

//Logic yoksa ve sadece gösterim yapılacaksa bu özellik kullanılabilir
//Dialog kısmını statefull vs. yerine copysini oluşturmak performans açısından daha verimlidir
class UpdateDialog extends AlertDialog {
  UpdateDialog({super.key, required BuildContext context})
      : super(
          title: const Text(Keys.versionUpdate),
          actions: [
            TextButton(
                onPressed: () {
                  //Geriye cevap döndürür
                  Navigator.pop(context, true);
                },
                child: const Text("Close")),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Update"),
            ),
          ],
        );
}

class ImageZoomDialog extends StatelessWidget {
  const ImageZoomDialog({super.key});

  final String _url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      //InteractiveViewer Zoom işlemini gerçekleştirmemize yarıyor
      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
