import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/screens/forget_screen/forget_password_screen.dart';
import 'package:movies_app/features/profile/presentation/bloc/userProfile/user_profile_bloc.dart';
import 'package:movies_app/features/splash/presentation/screens/splash_screen.dart';
import 'core/di/dependency_injection.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/login_screen/login_screen.dart';
import 'features/auth/presentation/screens/register_screen/register_screen.dart';
import 'core/routes_manger/routes.dart';
import 'core/screens_wrapper/screens_wrapper.dart';
import 'core/theme/AppTheme.dart';
import 'features/onborading/presentation/screens/OnboardingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
        BlocProvider<UserProfileBloc>(create: (_) => sl<UserProfileBloc>()),
      ],
      child: MaterialApp(
        title: 'Movies App',
        theme: AppThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        routes: {
          Routes.loginRoute: (context) => LoginScreen(),
          Routes.registerRoute: (context) => RegisterScreen(),
          Routes.onBoardingRoute: (context) => const OnboardingScreen(),
          Routes.forgetPassword: (context) => const ForgotPasswordScreen(),
          Routes.splashRoute: (context) => const SplashScreen(),
          Routes.browseRoute: (_) => const MovieBrowseWrapper(),
          Routes.searchRoute: (_) => const MovieSearchWrapper(),
          Routes.profileRoute: (_) => const ProfileWrapper(),
          Routes.updateProfileRoute: (_) => const UpdateProfileWrapper(),
        },
      ),
    );
  }
}
