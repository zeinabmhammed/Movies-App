import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/api/datasource/MoviesRemoteDataSourceImpl.dart';
import 'package:movies_app/core/network/dio_client.dart';
import 'package:movies_app/data/repos/movies_repository_impl.dart';
import 'package:movies_app/domain/useCase/get_movies_use_case.dart';
import 'package:movies_app/features/main_layout/home/cubit/movie_cubit.dart';
import 'package:movies_app/features/main_layout/main_layout.dart';

void main() {
  final dio = DioClient.create();
  final remoteDataSource = MoviesRemoteDataSourceImpl(dio);
  final repository = MoviesRepositoryImpl(remoteDataSource);
  final useCase = GetMoviesUseCase(repository);

  runApp(
    BlocProvider<MovieCubit>(
      create: (_) => MovieCubit(getMoviesUseCase: useCase)..fetchMovies(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const MainLayout(),
        );
      },
    );
  }
}