import 'package:movies_app/domain/entities/user_entity.dart';

class AuthResult{
  final String message ;
  final String token ;
  final UserEntity? user;

  AuthResult({required this.message,required this.token, this.user});
}