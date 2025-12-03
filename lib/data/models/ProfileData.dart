class ProfileData {
  final String id;
  final String email;
  final String name;
  final String phone;
  final int avaterId;

  ProfileData({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.avaterId,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json["_id"],
      email: json["email"],
      name: json["name"],
      phone: json["phone"],
      avaterId: json["avaterId"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "phone": phone,
    "avaterId": avaterId,
  };
}