import 'package:equatable/equatable.dart';

abstract class DeleteProfileEvent extends Equatable{
  const DeleteProfileEvent();
  @override
  List<Object?> get props => [];
}

class DeleteProfileRequested extends DeleteProfileEvent {}