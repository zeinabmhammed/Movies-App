import 'package:equatable/equatable.dart';
import '../../../../../domain/entities/auth_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthResult authResult;

  AuthSuccess(this.authResult);

  @override
  List<Object?> get props => [authResult];
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);

  @override
  List<Object?> get props=>[error];
}
