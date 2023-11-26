import 'package:hantaton_app/app/domain/app_api.dart';
import 'package:hantaton_app/feature/home/domain/entity/event/event_entity.dart';
import 'package:hantaton_app/feature/posts/domain/entity/post/post_entity.dart';
import 'package:hantaton_app/feature/posts/domain/post_repo.dart';
import 'package:injectable/injectable.dart';

import '../domain/home_repo.dart';

@Injectable(as: HomeRepo)
class NetHomeRepo implements HomeRepo {
  final AppApi api;

  NetHomeRepo(this.api);

  @override
  Future createCategory(String name) async {
    try {
      final response = await api.createCategory(name);
      return response.data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future createEvent(Map<String, dynamic> args) async {
    try {
      final response = await api.createEvent(args);
      return response.data["message"];
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteCategory(String id) async {
    try {
      await api.deleteCategory(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteEvent(String id) async {
    try {
      await api.deleteEvent(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future fetchCategories() async {
    try {
      final response = await api.fetchCategories();
      return response.data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future fetchCategory(String id) async {
    try {
      final response = await api.fetchPost(id);
      return PostEntity.fromJson(response.data["data"]);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future fetchEvent(String id) async {
    try {
      final response = await api.fetchPost(id);
      return PostEntity.fromJson(response.data["data"]);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future fetchEvents() async {
    try {
      final response = await api.fetchEvents();
      return response.data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future getRecommendation() async {
    try {
      final response = await api.getRecommendation();
      print(response.data);
      Iterable iterable =  response.data;
      final res = iterable.map((e) => EventEntity.fromJson(e)).toList();
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
