import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/screens/forget_screen/forget_password_screen.dart';
import 'package:movies_app/features/onborading/presentation/screens/OnboardingScreen.dart';
import 'package:movies_app/features/splash/presentation/screens/splash_screen.dart';
import 'core/app_routes.dart';
import 'core/di/dependency_injection.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/login_screen/login_screen.dart';
import 'features/auth/presentation/screens/register_screen/register_screen.dart';
import 'features/onborading/presentation/bloc/onboarding_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi(); // init GetIt dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => instance<AuthBloc>(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashRoute,
            routes: {
              AppRoutes.loginRoute: (context) =>  LoginScreen(),
              AppRoutes.registerRoute: (context) =>  RegisterScreen(),
              AppRoutes.onBoardingRoute: (context) => const OnboardingScreen(),
              AppRoutes.forgetPassword: (context) => const ForgotPasswordScreen(),
              AppRoutes.splashRoute: (context) => const SplashScreen(),
              // AppRoutes.homeRoute: (context) => const HomeScreen(), // لو حابب تضيفه بعدين
            },
            ),
        );
    }
}
