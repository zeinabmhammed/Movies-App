import '../../domain/entities/user_entity.dart';

class UserDto {
  final String name;
  final String email;
  final String phone;
  final int avatarId;

  UserDto({
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarId,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      avatarId: json["avaterId"] ?? 1,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      avatarId: avatarId,
      phone: phone,
    );
  }
}
