import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String? name;
  final String? phone;
  final int? imageId;

  const UpdateProfileEvent({this.name, this.phone, this.imageId});

  @override
  List<Object?> get props => [name, phone, imageId];
}

class LoadProfileEvent extends ProfileEvent {}

class DeleteProfileEvent extends ProfileEvent {}
