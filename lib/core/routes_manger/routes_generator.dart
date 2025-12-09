import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manger/routes.dart';
import 'package:movies_app/features/main_layout/main_layout.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen.dart';

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.movieDetailsRoute:
        return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
