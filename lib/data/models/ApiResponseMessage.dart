class ApiResponseMessage {
  final String message;

  ApiResponseMessage({required this.message});

  factory ApiResponseMessage.fromJson(Map<String, dynamic> json) {
    return ApiResponseMessage(message: json["message"] ?? "");
  }

  Map<String, dynamic> toJson() => {"message": message};
}