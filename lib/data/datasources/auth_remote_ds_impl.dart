import '../../core/network/api_manager.dart';
import '../../core/network/execute_api.dart';
import '../../domain/entities/auth_entity.dart';
import '../models/login_response.dart';
import '../models/register_response.dart';
import 'auth_remote_ds.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Result<AuthResult>> login(String email, String password) async {
    return executeApi(() async {
      final response = await apiManager.login(email, password);
      print("LOGIN API RESPONSE: ${response.data}");
      final loginRes = LoginResponse.fromJson(response.data);
      return AuthResult(
        message: loginRes.message,
        token: loginRes.token,
      );
    });
  }

  @override
  Future<Result<AuthResult>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  }) async {
    return executeApi(() async {
      final response = await apiManager.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        avatarId: avatarId,
      );
      final registerRes = RegisterResponse.fromJson(response.data);
      return AuthResult(
        message: registerRes.message,
        token: "",
        // register API مفيش token بيرجع، لو عايزة بعد كده login تعمل token
        user: registerRes.user.toEntity(),
      );
    });
  }
}
