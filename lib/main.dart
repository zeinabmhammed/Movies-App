import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/screens/forget_screen/forget_password_screen.dart';
import 'package:movies_app/features/splash/presentation/screens/splash_screen.dart';
import 'core/di/dependency_injection.dart';
import 'core/resources/theme/AppTheme.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/login_screen/login_screen.dart';
import 'features/auth/presentation/screens/register_screen/register_screen.dart';
import 'core/routes_manger/routes.dart';
import 'core/screens_wrapper/screens_wrapper.dart';
import 'features/main_layout/profile/presentation/bloc/userProfile/user_profile_bloc.dart';
import 'features/main_layout/profile/presentation/bloc/watchList/watch_list_bloc.dart';
import 'features/main_layout/profile/presentation/bloc/watchList/watch_list_event.dart';
import 'features/onborading/presentation/screens/OnboardingScreen.dart';
import 'package:movies_app/core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
        BlocProvider<UserProfileBloc>(create: (_) => sl<UserProfileBloc>()),
        BlocProvider<WatchListBloc>(
          create: (_) => sl<WatchListBloc>()..add(LoadWatchListEvent()),
        ),
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
          Routes.mainRoute: (_) => const MainLayoutWrapper(),
        },
      ),
    );
  }
}
