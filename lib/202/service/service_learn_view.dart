import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/202/service/post_model.dart';
import 'package:flutter_learn/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _dio;
  final baseUrl =
      "https://jsonplaceholder.typicode.com/"; //Dio Options içerisinden base url verebiliyoruz

  late final IPostService _postService;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _postService = PostService();
    fetchPostItemAdvance();
  }

  Future<void> fetchPostItemAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemAdvance();
    _changeLoading();
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
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              },
            ),
    );
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
