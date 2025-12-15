import '../../core/network/execute_api.dart';
import '../../domain/entities/auth_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Result<AuthResult>> login(String email, String password);
  Future<Result<AuthResult>> register({
  required String name,
  required String email,
  required String password,
  required String confirmPassword,
  required String phone,
  required int avatarId,
  });
}