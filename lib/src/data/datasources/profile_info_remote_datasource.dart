import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:social_app/src/data/models/user_model.dart';

abstract class ProfileInfoRemoteDataSource {
  Future<UserModel> getInfo();
}

class ProfileInfoRemoteDataSourceImpl extends ProfileInfoRemoteDataSource {
  @override
  Future<UserModel> getInfo() async {
    final String response =
        await rootBundle.loadString('assets/user_info.json');
    final data = jsonDecode(response);
    return UserModel.fromJson(data);
  }
}
