abstract class AuthRepository {
  Future<dynamic> signUp({
    required String username,
    required String password,
    required String rePassword,
    required String email,
    required String description,
    required String firstName,
    required String lastName,
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
}
