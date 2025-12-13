import 'package:equatable/equatable.dart';

abstract class DeleteProfileState extends Equatable{
  const DeleteProfileState();
  @override
  List<Object?> get props => [];
}

class DeleteProfileInitial extends DeleteProfileState {}

class DeleteProfileLoading extends DeleteProfileState {}

class DeleteProfileSuccess extends DeleteProfileState {}

class DeleteProfileFailure extends DeleteProfileState {
  final String error;
  const DeleteProfileFailure(this.error);

  @override
  List<Object?> get props => [error];
}