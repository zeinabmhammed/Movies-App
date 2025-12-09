import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getProfile();
  Future<String> updateProfile({String? name, String? phone, int? imageId});
  Future<void> deleteAccount();
}
