// lib/core/network/token_utils.dart
import 'package:dio/dio.dart';

String extractTokenFromResponse(Response response) {
  try {
    // Dio stores headers in response.headers
    // 'set-cookie' header usually contains "token=...; Path=/; HttpOnly"
    final cookies = response.headers.map['set-cookie'] ?? response.headers.map['Set-Cookie'];
    if (cookies == null || cookies.isEmpty) return "";

    // find cookie that contains 'token='
    final tokenCookie = cookies.firstWhere(
          (c) => c.toString().contains('token='),
      orElse: () => cookies.first,
    ).toString();

    final tokenPart = tokenCookie.split(';').first; // "token=...."
    return tokenPart.replaceFirst('token=', '').trim();
  } catch (_) {
    return "";
  }
}
