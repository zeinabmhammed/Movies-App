import 'package:equatable/equatable.dart';
import '../../../../../domain/entities/auth_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

// INITIAL
class AuthInitial extends AuthState {}

// LOADING
class AuthLoading extends AuthState {}

// SUCCESS
class AuthSuccess extends AuthState {
  final AuthResult authResult;

  AuthSuccess(this.authResult);

  @override
  List<Object?> get props => [authResult];
}

// FAILURE
class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);

  @override
  List<Object?> get props=>[error];
}
