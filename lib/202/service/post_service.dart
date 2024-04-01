import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learn/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addITemToService(PostModel postModel);
  Future<List<PostModel>?> fetchPostItemAdvance();
}

class PostService implements IPostService {
  final _dio;

  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addITemToService(PostModel postModel) async {
    try {
      final respponse =
          await _dio.post(_PostServicePaths.posts.name, data: postModel);

      return respponse.statusCode == HttpStatus.created;
    } on DioException catch (ex) {
      _ShowDebug.showDioExeption(ex, this);
      return false;
    }
  }

  @override
  Future<List<PostModel>?> fetchPostItemAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        //_datas değişkeninin list olduğunu derleyiciye kanıtladıktan sonra tüm liste özelliklerini kullanabiliriz
        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
        return null;
      }
      return null;
    } on DioException catch (ex) {
      _ShowDebug.showDioExeption(ex, this);
      return null;
    }
  }
}

enum _PostServicePaths { posts, comments }

//Direk print atmak yerine bu şekilde kullanmak daha iyidir
//T type kullanımı ise hata veren sınıfı yakalamak amacı ile kullanılabilir
class _ShowDebug {
  static void showDioExeption<T>(DioException exception, T type) {
    if (kDebugMode) {
      print("Dio Hatası :${exception.message ?? "Hata mesajı yok"}");
      print(type);
    }
  }
}



//Dio da queryParameter kullanımı bulunmaktadır 
//İsteğe eklemek için Dio initilize edilirken construtorda queryParameters yazılır 
//ardından {key:"value"} şeklinde parametreler eklenir