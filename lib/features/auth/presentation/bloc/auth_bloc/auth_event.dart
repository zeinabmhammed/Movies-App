import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// LOGIN EVENT
class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

// REGISTER EVENT
class RegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final int avatarId;

  RegisterRequested({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.avatarId,
  });

  @override
  List<Object?> get props => [name, email, password, confirmPassword, phone,avatarId];
}
