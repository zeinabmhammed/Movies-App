import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_config.dart';

class DioFactoryMovies {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.moviesBaseUrl,
        connectTimeout: Duration(milliseconds: ApiConfig.connectTimeout),
        receiveTimeout: Duration(milliseconds: ApiConfig.receiveTimeout),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          print("REQUEST [${options.method}] => PATH: ${options.uri}");

          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString("token") ?? "";
          if (token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(
            "RESPONSE [${response.statusCode}] => PATH: ${response.requestOptions.uri}",
          );
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("DIO EXCEPTION => ${e.message}");

          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
