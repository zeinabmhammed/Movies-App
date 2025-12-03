import 'package:movies_app/data/models/ProfileResponse.dart';

abstract class UserRemoteDataSource {
  Future<ProfileResponse> getProfile();
  Future<String> updateProfile({
    String? name,
    String? phone,
    int? imageId,
  });

  Future<String> deleteAccount();

}