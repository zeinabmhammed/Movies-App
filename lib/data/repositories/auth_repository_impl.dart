import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_remote_ds.dart';
import '../../core/network/execute_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<AuthResult>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

  @override
  Future<Result<AuthResult>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  }) {
    return remoteDataSource.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        avatarId: avatarId,
        );
    }
}
