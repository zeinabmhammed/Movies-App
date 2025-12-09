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
import 'core/routes_manger/routes.dart';
import 'core/screens_wrapper/screens_wrapper.dart';
import 'core/theme/AppTheme.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi(); // init GetIt dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => instance<AuthBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'Movies App',
          theme: AppThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashRoute,
            routes: {
              AppRoutes.loginRoute: (context) =>  LoginScreen(),
              AppRoutes.registerRoute: (context) =>  RegisterScreen(),
              AppRoutes.onBoardingRoute: (context) => const OnboardingScreen(),
              AppRoutes.forgetPassword: (context) => const ForgotPasswordScreen(),
              AppRoutes.splashRoute: (context) => const SplashScreen(),
              Routes.browseRoute: (_) => const MovieBrowseWrapper(),
              Routes.searchRoute: (_) => const MovieSearchWrapper(),
              Routes.profileRoute: (_) => const ProfileWrapper(),
              Routes.updateProfileRoute: (_) => const UpdateProfileWrapper(),

            },
            ),
        );
    }
}

