import 'package:flutter/material.dart';
import 'core/routes_manger/routes.dart';
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
        Routes.browseRoute: (_) => const MovieBrowseWrapper(),
        Routes.searchRoute: (_) => const MovieSearchWrapper(),
        Routes.profileRoute: (_) => const ProfileWrapper(),
        Routes.updateProfileRoute: (_) => const UpdateProfileWrapper(),
      },
      initialRoute: Routes.profileRoute,
    );
  }
}
