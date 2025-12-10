import '../../core/network/execute_api.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repo.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Result<AuthResult>> call(
      String email,
      String password,
      ) async {

    final result = await repository.login(email, password);
    print("LoginUseCase result: $result");  // <--- دي هتوريك النتيجة
    return result;
    }
}