import '../../core/network/execute_api.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repo.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<Result<AuthResult>> call({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  }) {
    return repository.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        avatarId: avatarId,
        );
    }
}