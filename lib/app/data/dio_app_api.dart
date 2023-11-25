import 'package:hantaton_app/app/domain/app_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../domain/app_config.dart';
import 'auth_interceptor.dart';

@Singleton(as: AppApi)
class DioAppApi implements AppApi {
  late final Dio dio;

  DioAppApi(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: 15000,
    );
    dio = Dio(options);
    if (kDebugMode) dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(AuthInterceptor());
  }

  @override
  Future<Response> getProfile() {
    try {
      return dio.get("auth/users/me/");
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> passwordUpdate(
      {required String oldPassword, required String newPassword}) {
    return dio.put("/auth/user", queryParameters: {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    });
  }

  @override
  Future<Response> refreshToken({String? refreshToken}) {
    try {
      return dio.post("/auth/jwt/refresh", data: {'refresh': refreshToken});
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signIn({required String password, required String email}) {
    try {
      return dio.post("auth/jwt/create/",
          data: {"email": email, "password": password});
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signUp(
      {required Map<String,dynamic> data}) {
    try {
      return dio.post("/auth/users/", data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> userUpdate({String? username, String? email}) {
    return dio.post("/auth/user", data: {
      "username": username,
      "email": email,
    });
  }

  @override
  Future request(String path) {
    try {
      return dio.request(path);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future fetch(RequestOptions requestOptions) {
    return dio.fetch(requestOptions);
  }

  @override
  Future fetchPosts(int fetchLimit, int offset) {
    return dio.get("/data/posts",
        queryParameters: {'fetchLimit': fetchLimit, 'offset': offset});
  }

  @override
  Future createPost(Map args) {
    return dio.post("/data/posts",
        data: {"name": args["name"], "content": args["content"]});
  }

  @override
  Future fetchPost(String id) {
    return dio.get("/data/posts/$id");
  }

  @override
  Future deletePost(String id) {
    return dio.delete("/data/posts/$id");
  }

  @override
  Future createCategory(String name) {
    return dio.post("/category/",data: {
      'name':name
    });
  }

  @override
  Future createEvent(Map<String,dynamic> data) {
    return dio.post("/category/",data: data);
  }

  @override
  Future deleteCategory(String id) {
    return dio.delete("/category/$id");

  }

  @override
  Future deleteEvent(String id) {
    return dio.delete("/event/$id");

  }

  @override
  Future fetchCategories() {
    return dio.get("/category/");
  }

  @override
  Future fetchCategory(String id) {
    return dio.get("/category/$id");
  }

  @override
  Future fetchEvent(String id) {
    return dio.get("/event/$id");
  }

  @override
  Future fetchEvents() {
    return dio.get("/event/");
  }
}



