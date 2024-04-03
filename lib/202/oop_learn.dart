import 'dart:io';

import 'package:flutter_learn/202/custom_exeption.dart';

//İnterface arayüzüdür
//Abstract bir clasa yani soyur clasa somut metot yazarsak onu kendimize göre
abstract class IFileDownload {
  void donwloadItem(FileItem? fileItem);

  void toShare() {
    print("Return İşlemleri");
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  @override
  void donwloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadExeption();
    }
    print("asd");
  }

  @override
  void toShare() {
    print("İmplement eden sınıfa göre shate");
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem({required this.name, required this.file});
}

//Implements ve Extends farkları

//Implements yaptığımızda üst sınıfın bütün özellikleri alt sınıfta tekrar yazılır
//içi boş ve içi dolu methodlar tekrardan yazılmak zorundadır

//Extends de ise üst sınıftaki sadece içi boş özellikler alt sınıfta tekrardan yazılır
//içi dolu olan metotlar ise olduğu gibi kullanılabilir

//on özelliği ile sadece FileDownload türündeki classlara eklenebilir...
mixin ShareMixin on IFileDownload {
  void PdfShare() {}
}

class FurkanDownload extends IFileDownload with ShareMixin {
  @override
  void donwloadItem(fileItem) {
    // TODO: implement donwloadItem
  }
}
