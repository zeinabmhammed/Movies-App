import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_ds.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> getProfile() async {
    final profileResponse = await remoteDataSource.getProfile();
    final data = profileResponse.data!;

    return User(
      id: data.id,
      name: data.name,
      phone: data.phone,
      imageId: data.avaterId,
    );
  }

  @override
  Future<String> updateProfile({
    String? name,
    String? phone,
    int? imageId,
  }) async {
    final message = await remoteDataSource.updateProfile(
      name: name,
      phone: phone,
      imageId: imageId,
    );
    return message;
  }

  @override
  Future<void> deleteAccount() async {
    await remoteDataSource.deleteAccount();
  }
}