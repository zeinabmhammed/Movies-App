import '../../repositories/user_repository.dart';

class UpdateProfileUseCase {
  final UserRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<String> call({
    String? name,
    String? phone,
    int? imageId,
  }) async{
    return await repository.updateProfile(
      name: name,
      phone: phone,
      imageId: imageId,
    );
  }
}