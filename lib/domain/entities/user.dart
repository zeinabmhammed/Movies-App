class User {
  final String id;
  final String name;
  final String phone;
  final int imageId;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.imageId,
  });
  @override
  List<Object?> get props => [id, name, phone, imageId];

  User copyWith({
    String? name,
    String? phone,
    int? imageId,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      imageId: imageId ?? this.imageId,
    );
  }
}