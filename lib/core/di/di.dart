import 'package:movies_app/api/datasource/MoviesRemoteDataSourceImpl.dart';
import 'package:movies_app/data/repos/movies_repository_impl.dart';
import 'package:movies_app/domain/useCase/get_movies_use_case.dart';

import '../network/dio_client.dart';

final dio = DioClient.create();
final remoteDataSource = MoviesRemoteDataSourceImpl(dio);
final repository = MoviesRepositoryImpl(remoteDataSource);
final getMoviesUseCase = GetMoviesUseCase(repository);