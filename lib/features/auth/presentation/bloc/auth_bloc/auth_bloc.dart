import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/network/execute_api.dart';
import '../../../../../domain/entities/auth_entity.dart';
import '../../../../../domain/usecases/login_usecase.dart';
import '../../../../../domain/usecases/register_uescase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
      : super(AuthInitial()) {

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUseCase(event.email, event.password);
      print("AuthBloc login result: $result");
      if (result is Success<AuthResult>) {
        final token = result.data.token;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);

        emit(AuthSuccess(result.data, token));
      } else if (result is Failure<AuthResult>) {
        emit(AuthFailure(result.message));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await registerUseCase(
        name: event.name,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
        phone: event.phone,
        avatarId: event.avatarId,
      );
      if (result is Success<AuthResult>) {
        final token = result.data.token;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);

        emit(AuthSuccess(result.data,token));
      } else if (result is Failure<AuthResult>) {
        emit(AuthFailure(result.message));
      }
    });
  }
}