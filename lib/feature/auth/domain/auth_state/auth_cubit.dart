import 'package:hantaton_app/app/domain/error_entity/error_entity.dart';
import 'package:hantaton_app/feature/auth/domain/auth_repository.dart';
import 'package:hantaton_app/feature/auth/domain/entities/token_entity/token_entity.dart';
import 'package:hantaton_app/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

part 'auth_cubit.g.dart';

@Singleton()
class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  void finishWelcomeScreen() {
    emit(AuthState.waiting());
    Future.delayed(const Duration(milliseconds: 400)).then((value) =>
        emit(AuthState.authorized(const UserEntity(username: '', id: 0))));
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthState.waiting());
    try {
      final TokenEntity token =
          await authRepository.signIn(password: password, email: email);
      emit(AuthState.authorized(UserEntity(
          username: '',
          id: 0,
          accessToken: token.access,
          refreshToken: token.refresh)));
      final UserEntity userEntity = await authRepository.getProfile();
      emit(AuthState.authorized(UserEntity(
          username: userEntity.username,
          id: userEntity.id,
          accessToken: token.access,
          refreshToken: token.refresh,
          last_name: userEntity.last_name,
          first_name: userEntity.first_name)));
    } catch (error, st) {
      addError(error, st);
    }
  }

  void logOut() => emit(AuthState.notAuthorized());

  Future<void> signUp({
    required String username,
    required String password,
    required String rePassword,
    required String email,
    required String description,
    required String firstName,
    required String lastName,
  }) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity = await authRepository.signUp(
          password: password,
          username: username,
          email: email,
          rePassword: rePassword,
          description: description,
          firstName: firstName,
          lastName: lastName);
      emit(AuthState.authorized(userEntity));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> refreshToken() async {
    final refreshToken =
        state.whenOrNull(authorized: (userEntity) => userEntity.refreshToken);
    try {
      final UserEntity userEntity =
          await authRepository.refreshToken(refreshToken: refreshToken);
      emit(AuthState.authorized(userEntity));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> getProfile() async {
    try {
      _updateUserState(const AsyncSnapshot.waiting());
      final UserEntity newUserEntity = await authRepository.getProfile();
      emit(state.maybeWhen(
        orElse: () => state,
        authorized: (userEntity) => AuthState.authorized(
            userEntity.copyWith(username: newUserEntity.username)),
      ));
      _updateUserState(const AsyncSnapshot.withData(
          ConnectionState.done, "Успешное получение данных"));
    } catch (error) {
      _updateUserState(AsyncSnapshot.withError(ConnectionState.done, error));
    }
  }

  void _updateUserState(AsyncSnapshot asyncSnapshot) {
    emit(state.maybeWhen(
      orElse: () => state,
      authorized: (userEntity) {
        return AuthState.authorized(
            userEntity.copyWith(userState: asyncSnapshot));
      },
    ));
  }

  Future<void> userUpdate({
    String? username,
    String? email,
  }) async {
    try {
      _updateUserState(const AsyncSnapshot.waiting());
      await Future.delayed(const Duration(seconds: 1));
      final bool isEmptyEmail = email?.trim().isEmpty == true;
      final bool isEmptyUsername = username?.trim().isEmpty == true;

      final UserEntity newUserEntity = await authRepository.userUpdate(
          email: isEmptyEmail ? null : email,
          username: isEmptyUsername ? null : username);
      emit(state.maybeWhen(
        orElse: () => state,
        authorized: (userEntity) => AuthState.authorized(
            userEntity.copyWith(username: newUserEntity.username)),
      ));
      _updateUserState(const AsyncSnapshot.withData(
          ConnectionState.done, "Успешное обновление данных"));
    } catch (error) {
      _updateUserState(AsyncSnapshot.withError(ConnectionState.done, error));
    }
  }

  Future<void> passwordUpdate({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      _updateUserState(const AsyncSnapshot.waiting());
      await Future.delayed(const Duration(seconds: 1));

      if (newPassword.trim().isEmpty == true) {
        throw ErrorEntity(message: "Новый пароль пустой");
      }

      final message = await authRepository.passwordUpdate(
          newPassword: newPassword, oldPassword: oldPassword);

      _updateUserState(AsyncSnapshot.withData(ConnectionState.done, message));
    } catch (error) {
      _updateUserState(AsyncSnapshot.withError(ConnectionState.done, error));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    final state = AuthState.fromJson(json);
    return state.whenOrNull(
      authorized: (userEntity) => AuthState.authorized(userEntity),
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state
            .whenOrNull(
              authorized: (userEntity) => AuthState.authorized(userEntity),
            )
            ?.toJson() ??
        AuthState.notAuthorized().toJson();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(AuthState.error(error));
    super.addError(error, stackTrace);
  }
}
