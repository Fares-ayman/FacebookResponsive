

import 'dart:convert';

import 'package:facebook/data/local_datasource/local_datasource.dart';
import 'package:facebook/data/models/post_model.dart';
import 'package:facebook/data/models/story_model.dart';
import 'package:facebook/data/models/user_model.dart';
import 'package:facebook/domain/entities/post_entity.dart';
import 'package:facebook/domain/entities/story_entity.dart';
import 'package:facebook/domain/entities/user_entity.dart';
import 'package:flutter/services.dart';

class LocalDataSourceImpl extends LocalDataSource{
  @override
  Future<List<UserEntity>> getAllUsers() async{
   final respose=await rootBundle.loadString("assets/users_json.json");
   final data=json.decode(respose) as List<dynamic>;
   return data.map((e) => UserModel.fromjson(e)).toList();
  }

  @override
  Future<List<StoryEntity>> getAllStories() async{
    final respose=await rootBundle.loadString("assets/story_json.json");
    final data=json.decode(respose) as List<dynamic>;
    return data.map((e) => StoryModel.fromjson(e)).toList();
  }

  @override
  Future<List<PostEntity>> getAllposts() async{
    final respose=await rootBundle.loadString("assets/posts_json.json");
    final data=json.decode(respose) as List<dynamic>;
    return data.map((e) => PostModel.fromjson(e)).toList();
  }

}