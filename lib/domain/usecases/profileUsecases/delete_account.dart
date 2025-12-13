import '../../repositories/user_repository.dart';

class DeleteUserProfileUseCase {
  final UserRepository repository;

  DeleteUserProfileUseCase(this.repository);

  Future<void> call() async{
    return await repository.deleteAccount();
  }
}