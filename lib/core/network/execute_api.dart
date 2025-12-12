import 'package:dio/dio.dart';

abstract class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  Failure(this.message);
}

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    final response = await apiCall();
    return Success(response);
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.connectionError) {
      return Failure("No internet connection");
    }
    if (e.type == DioExceptionType.badResponse) {
      final data = e.response?.data;

      if (data != null && data['message'] != null) {
        final msg = data['message'];

        if (msg is List) {
          return Failure(msg.join(", "));
        }

        return Failure(msg.toString());
      }

      return Failure('Server error (${e.response?.statusCode})');
    }

    return Failure("Something went wrong");
  }
}
