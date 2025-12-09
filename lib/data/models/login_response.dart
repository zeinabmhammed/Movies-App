class LoginResponse {
  final String message;
  final String token;

  LoginResponse({
    required this.message,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json["message"] ?? "An error occurred",
      token: json["token"] ?? "", // اقرأ التوكن من هنا مباشرة
    );
    // -------------------- نهاية التعديل --------------------
  }
}