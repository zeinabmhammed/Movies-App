import 'package:movies_app/data/datasources/user_remote_ds.dart';
import 'package:movies_app/data/models/ApiResponseMessage.dart';
import 'package:movies_app/data/models/ProfileResponse.dart';
import '../../core/network/api_manager.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiManager apiManager;

  UserRemoteDataSourceImpl(this.apiManager);

  @override
  Future<String> deleteAccount() async {
    try {
      final response = await apiManager.deleteAccount();
      return response.message;
    } catch (e) {
      throw Exception("Failed to delete account: $e");
    }
  }

  @override
  Future<ProfileResponse> getProfile() async {
    try {
      final response = await apiManager.getProfile();
      return response;
    } catch (e) {
      throw Exception("Failed to load profile: $e");
    }
  }

  @override
  Future<String> updateProfile({
    String? name,
    String? phone,
    int? imageId,
  }) async {
    try {
      final ApiResponseMessage response = await apiManager.updateProfile(
        name: name,
        phone: phone,
        avaterId: imageId,
      );
      return response.message;
    } catch (e) {
      throw Exception("Failed to update profile: $e");
    }
  }
}
