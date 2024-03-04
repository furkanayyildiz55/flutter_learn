import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  final String ImageSrc =
      "https://cdn-icons-png.flaticon.com/128/13823/13823340.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("Image Learn"),
          SizedBox(
            height: 400,
            width: 300,
            child: Image.asset(
              ImageItems().androidPng,
              //! Fit özelliği görseli verilen alana sığdırma için ayarlamalar gerçekleştirir
              fit: BoxFit.fitHeight,
              //! Görselin geldiği alanlara verilen rengi ekler //İconlarda işe yarar bir özelliktir
              //color: Colors.black26,
            ),
          ),
          Image.network(
            ImageSrc,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}

class ImageItems {
  final String applePng = "assets/apple.png";
  final String androidPng = "assets/png/android.png";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => "assets/png/$name.png";
}
