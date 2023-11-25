import 'package:dio/dio.dart';

abstract class AppApi {
  Future<dynamic> signUp({
    required Map<String,dynamic> data,
  });

  Future<dynamic> signIn({
    required String password,
    required String email,
  });

  Future<dynamic> getProfile();

  Future<dynamic> userUpdate({
    String? username,
    String? email,
  });

  Future<dynamic> passwordUpdate({
    required String oldPassword,
    required String newPassword,
  });

  Future<dynamic> refreshToken({String? refreshToken});

  Future<dynamic> request(String path);

  Future<dynamic> fetch(RequestOptions requestOptions);

  Future<dynamic> fetchPosts(int fetchLimit, int offset);
  Future<dynamic> fetchPost(String id);
  Future<dynamic> deletePost(String id);

  Future<dynamic> createPost(Map args);

  Future<dynamic> fetchCategories();
  Future<dynamic> fetchCategory(String id);
  Future<dynamic> deleteCategory(String id);

  Future<dynamic> createCategory(String name);


  Future<dynamic> fetchEvents();
  Future<dynamic> fetchEvent(String id);
  Future<dynamic> deleteEvent(String id);

  Future<dynamic> createEvent(Map<String,dynamic> name);
}
