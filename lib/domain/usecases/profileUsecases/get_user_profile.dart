import '../../entities/user.dart';
import '../../repositories/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository repository;
  GetUserProfileUseCase(this.repository);

  Future<User> call() async {
    return await repository.getProfile();
  }
}