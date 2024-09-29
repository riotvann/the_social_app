import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:social_app/src/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAll();
}

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  @override
  Future<List<PostModel>> getAll() async {
    final String response = await rootBundle.loadString('assets/posts.json');
    await Future.delayed(const Duration(seconds: 2));
    final data = jsonDecode(response) as List;
    return data.map((json) => PostModel.fromJson(json)).toList();
  }
}
