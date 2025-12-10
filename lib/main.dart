import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/routes_manger/routes_generator.dart';
import 'package:movies_app/features/main_layout/home/bloc/movies_bloc.dart';
import 'package:movies_app/features/main_layout/home/bloc/movies_event.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
          return BlocProvider(
            create: (_) => getIt<MoviesBloc>()..add(FetchMoviesEvent()),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: RoutesGenerator.getRoute,
            ),
          );
        },
    );
  }
}