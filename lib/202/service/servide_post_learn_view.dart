import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  bool _isLoading = false;
  late final Dio _dio;
  final baseUrl =
      "https://jsonplaceholder.typicode.com/"; //Dio Options içerisinden base url verebiliyoruz

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _addITemToService(PostModel postModel) async {
    _changeLoading();
    final respponse = await _dio.post("posts", data: postModel);

    if (respponse.statusCode == HttpStatus.created) {
      print("POST BAŞARILI");
    }

    _changeLoading();
  }

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.amberAccent,
                    ),
                  )
                : const SizedBox.shrink()
          ],
          title: const Text("Service Learn"),
        ),
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: _titleController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Body"),
              controller: _bodyController,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "User Id"),
              controller: _userIdController,
            ),
            TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_titleController.text.isNotEmpty &&
                            _bodyController.text.isNotEmpty &&
                            _userIdController.text.isNotEmpty) {
                          final model = PostModel(
                              title: _titleController.text,
                              body: _bodyController.text,
                              userId: int.tryParse(_userIdController.text));

                          _addITemToService(model);
                        }
                      },
                child: const Text("Send"))
          ],
        ));
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
