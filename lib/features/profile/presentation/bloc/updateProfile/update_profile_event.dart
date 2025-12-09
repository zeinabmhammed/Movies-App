import 'package:equatable/equatable.dart';

abstract class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();
  @override
  List<Object?> get props => [];
}
class UpdateProfileRequested extends UpdateProfileEvent {
  final String? name;
  final String? phone;
  final int? imageId;

  const UpdateProfileRequested(this.name, this.phone, this.imageId);
}