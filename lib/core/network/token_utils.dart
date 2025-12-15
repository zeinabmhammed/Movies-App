import 'package:dio/dio.dart';

String extractTokenFromResponse(Response response) {
  try {
    final cookies = response.headers.map['set-cookie'] ?? response.headers.map['Set-Cookie'];
    if (cookies == null || cookies.isEmpty) return "";

    final tokenCookie = cookies.firstWhere(
          (c) => c.toString().contains('token='),
      orElse: () => cookies.first,
    ).toString();

    final tokenPart = tokenCookie.split(';').first;
    return tokenPart.replaceFirst('token=', '').trim();
  } catch (_) {
    return "";
  }
}
