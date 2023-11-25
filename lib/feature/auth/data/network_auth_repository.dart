import 'package:hantaton_app/app/domain/app_api.dart';
import 'package:hantaton_app/feature/auth/data/dto/user_dto.dart';
import 'package:hantaton_app/feature/auth/domain/auth_repository.dart';
import 'package:hantaton_app/feature/auth/domain/entities/token_entity/token_entity.dart';
import 'package:hantaton_app/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class NetworkAuthRepository implements AuthRepository {
  final AppApi api;

  NetworkAuthRepository(this.api);

  @override
  Future<UserEntity> getProfile() async {
    try {
      final response = await api.getProfile();
      return UserEntity.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> passwordUpdate(
      {required String oldPassword, required String newPassword}) async {
    try {
      final Response response = await api.passwordUpdate(
          newPassword: newPassword, oldPassword: oldPassword);
      return response.data["message"];
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> refreshToken({String? refreshToken}) async {
    try {
      final response = await api.refreshToken(refreshToken: refreshToken);
      return TokenEntity.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> signIn(
      {required String password, required String email}) async {
    try {
      final response = await api.signIn(password: password, email: email);
      return TokenEntity.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signUp({
    required String username,
    required String password,
    required String rePassword,
    required String email,
    required String description,
    required String firstName,
    required String lastName,

  }) async {
    try {
      final data=<String,dynamic>{
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "re_password": rePassword
      };
      final response = await api.signUp(
          data:data);
      return UserEntity.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> userUpdate({String? username, String? email}) async {
    try {
      final response = await api.userUpdate(username: username, email: email);
      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
