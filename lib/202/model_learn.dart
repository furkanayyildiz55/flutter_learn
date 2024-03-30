//Model null gelebilir nullable initialize
class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

//Veri vardır ve gelmek zorundadır constructor ile initialize edilir
class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
}

//Veri sadece initialize xzamanında gelebilir ve çalışma hayatı boyunca değişemez
//final ile değişken verisi sadece bir kez atanır ve değiştirilemez
class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

//PostModel3 ile aynı sadece constructorda değişkenler isimlendirilmiş sekilde çıkmaktadır
class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}

//Ana değişkenler gizlenir Encapsulation
class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  PostModel5(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  int get GetUserId => _userId;

  /*{
     _userId = userId;
     _id = id;
     _title = title;
     _body = body;
    }*/
}

//Ana değişkenler gizlenir Encapsulation
//late ifadesi verinin sonradan geleceğini ifade eder
//* late final ifadesi verinin sadece constructor anında sonradan gelebileceğini ifade eder
class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6(
      {required int userId,
      required int id,
      required String title,
      required String body}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//PostModel6 ile aynı sadece değişkenlere değer verilmediği zaman defauld değer alırlar
class PostModel7 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7(
      {int userId = 0, int id = 0, String title = "", String body = ""}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//Her yeni değişken initalize edilmek zorundadır
//farklı initialize çeşitleri vardır

//* Servisten veri geliyorsa bu modelin kullanılması daha doğru olur. Veriler bazen null gelebilir.
class PostModel8 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void updateBody(String? data) {
    //data.length; null olma durumunda dolayı ceriyi kontrol etmezsek hata verir
    //veri set ederken her zaman null olma durumu ele alınmalıdır
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.title);
  }
}
