import 'package:movies_app/data/models/uesr_dto.dart';

class RegisterResponse {
  final String message;
  final UserDto user;

  RegisterResponse({
    required this.message,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        message: json["message"] ?? "",
        user: UserDto.fromJson(json["data"] ?? {}),
        );
    }
}