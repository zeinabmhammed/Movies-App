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
      return Failure(
        e.response?.data['message'] ??
            'Server error (${e.response?.statusCode})',
      );
    }
    return Failure("Something went wrong");
  }
}
