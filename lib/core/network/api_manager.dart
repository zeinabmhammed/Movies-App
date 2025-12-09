import 'package:dio/dio.dart';

import 'api_config.dart';
import 'doi_factory.dart';

class ApiManager {
  final Dio _dio = DioFactory.createDio();

  Future<Response> login(String email, String password) {
    return _dio.post(
      ApiConfig.loginEndpoint,
      data: {"email": email, "password": password},
    );
  }

  Future<Response> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  }) {
    return _dio.post(
        ApiConfig.registerEndpoint,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "phone": phone,
          "avaterId": avatarId
          },
        );
    }
}
