import 'package:flutter/material.dart';
import 'core/app_routes.dart';
import 'core/screens_wrapper/screens_wrapper.dart';
import 'core/theme/AppTheme.dart';
import 'injection_container.dart';

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
    return MaterialApp(
      title: 'Movies App',
      theme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.browseRoute: (_) => const MovieBrowseWrapper(),
        AppRoutes.searchRoute: (_) => const MovieSearchWrapper(),
        AppRoutes.profileRoute: (_) => const ProfileWrapper(),
        AppRoutes.updateProfileRoute: (_) => const UpdateProfileWrapper(),
      },
      initialRoute: AppRoutes.profileRoute,
    );
  }
}
