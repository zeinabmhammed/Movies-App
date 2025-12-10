// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/api_manger.dart' as _i254;
import '../../api/datasource/movies_details_remote_datasource_impl.dart'
    as _i831;
import '../../api/datasource/movies_suggestions_remote_datasource_impl.dart'
    as _i544;
import '../../api/datasource/MoviesRemoteDataSourceImpl.dart' as _i739;
import '../../data/datasource/movies_details_remote_datasource.dart' as _i497;
import '../../data/datasource/movies_remote_datasource.dart' as _i88;
import '../../data/datasource/movies_suggustions_remote_datasource.dart'
    as _i317;
import '../../data/repos/movies_details_repository_impl.dart' as _i756;
import '../../data/repos/movies_repository_impl.dart' as _i493;
import '../../data/repos/movies_suggustions_repository_impl.dart' as _i549;
import '../../domain/repos/movies_details_repository.dart' as _i238;
import '../../domain/repos/movies_repository.dart' as _i768;
import '../../domain/repos/movies_suggestions_repository.dart' as _i359;
import '../../domain/useCase/get_movies_details_use_case.dart' as _i724;
import '../../domain/useCase/get_movies_suggestions_use_case.dart' as _i69;
import '../../domain/useCase/get_movies_use_case.dart' as _i494;
import '../../features/main_layout/home/bloc/movies_bloc.dart' as _i509;
import '../../features/movie_details/bloc/movie_details_bloc.dart' as _i1059;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i254.ApiManager>(() => _i254.ApiManager());
    gh.factory<_i497.MovieDetailsRemoteDataSource>(
      () => _i831.MovieDetailsRemoteDataSourceImpl(gh<_i254.ApiManager>()),
    );
    gh.factory<_i317.MoviesSuggestionsRemoteDataSource>(
      () => _i544.MoviesSuggestionsRemoteDataSourceImpl(gh<_i254.ApiManager>()),
    );
    gh.factory<_i88.MoviesRemoteDataSource>(
      () => _i739.MoviesRemoteDataSourceImpl(gh<_i254.ApiManager>()),
    );
    gh.factory<_i768.MoviesRepository>(
      () => _i493.MoviesRepositoryImpl(gh<_i88.MoviesRemoteDataSource>()),
    );
    gh.factory<_i238.MovieDetailsRepository>(
      () => _i756.MovieDetailsRepositoryImpl(
        gh<_i497.MovieDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i359.MoviesSuggestionsRepository>(
      () => _i549.MoviesSuggestionsRepositoryImpl(
        gh<_i317.MoviesSuggestionsRemoteDataSource>(),
      ),
    );
    gh.factory<_i494.GetMoviesUseCase>(
      () => _i494.GetMoviesUseCase(gh<_i768.MoviesRepository>()),
    );
    gh.factory<_i509.MoviesBloc>(
      () => _i509.MoviesBloc(gh<_i494.GetMoviesUseCase>()),
    );
    gh.factory<_i69.GetMoviesSuggestionsUseCase>(
      () => _i69.GetMoviesSuggestionsUseCase(
        gh<_i359.MoviesSuggestionsRepository>(),
      ),
    );
    gh.factory<_i724.GetMovieDetailsUseCase>(
      () => _i724.GetMovieDetailsUseCase(gh<_i238.MovieDetailsRepository>()),
    );
    gh.factory<_i1059.MovieDetailsBloc>(
      () => _i1059.MovieDetailsBloc(
        gh<_i724.GetMovieDetailsUseCase>(),
        gh<_i69.GetMoviesSuggestionsUseCase>(),
      ),
    );
    return this;
  }
}
