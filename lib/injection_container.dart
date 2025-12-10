import 'package:get_it/get_it.dart';
import 'package:movies_app/data/datasources/user_remote_ds.dart';
import 'package:movies_app/data/datasources/user_remote_ds_impl.dart';
import 'package:movies_app/data/datasources/watchList_local_ds.dart';
import 'package:movies_app/data/datasources/watchList_local_ds_impl.dart';
import 'package:movies_app/data/repositories/history_repository_impl.dart';
import 'package:movies_app/data/repositories/user_repository_impl.dart';
import 'package:movies_app/domain/repositories/user_repository.dart';
import 'package:movies_app/domain/usecases/watchListUsecases/get_watchList.dart';
import 'package:movies_app/domain/usecases/watchListUsecases/remove_from_watchList.dart';
import 'package:movies_app/features/search/presentation/bloc/movie_search_bloc.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasources/history_local_ds.dart';
import 'data/datasources/history_local_ds_impl.dart';
import 'data/datasources/movies_remote_ds.dart';
import 'data/datasources/movies_remote_ds_impl.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'data/repositories/watchList_repository_impl.dart';
import 'domain/repositories/history_repository.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/repositories/watchList_repository.dart';
import 'domain/usecases/browse_movies.dart';
import 'domain/usecases/historyusecases/add_to_history.dart';
import 'domain/usecases/historyusecases/get_history.dart';
import 'domain/usecases/profileUsecases/delete_account.dart';
import 'domain/usecases/profileUsecases/get_user_profile.dart';
import 'domain/usecases/profileUsecases/update_profile.dart';
import 'domain/usecases/search_movies.dart';
import 'features/browse/presentation/bloc/movie_browse_bloc.dart';
import 'features/profile/presentation/bloc/deleteProfile/delete_profile_bloc.dart';
import 'features/profile/presentation/bloc/history/history_bloc.dart';
import 'features/profile/presentation/bloc/updateProfile/update_profile_bloc.dart';
import 'features/profile/presentation/bloc/userProfile/user_profile_bloc.dart';
import 'features/profile/presentation/bloc/watchList/watch_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);

  sl.registerLazySingleton(() => ApiManager());

  sl.registerLazySingleton<WatchListRemoteDataSource>(
    () => WatchListRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<HistoryLocalDataSource>(
    () => HistoryLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<WatchListRepository>(
    () => WatchListRepositoryImpl(sl<WatchListRemoteDataSource>()),
  );
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  sl.registerLazySingleton<HistoryRepository>(() => HistoryRepoImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  sl.registerLazySingleton(
    () => RemoveFromWatchListUseCase(sl<WatchListRepository>()),
  );
  sl.registerLazySingleton(
    () => GetWatchListUseCase(sl<WatchListRepository>()),
  );

  sl.registerLazySingleton(() => AddToHistoryUseCase(sl<HistoryRepository>()));
  sl.registerLazySingleton(() => GetHistoryUseCase(sl<HistoryRepository>()));

  sl.registerLazySingleton(() => SearchMoviesUseCase(sl<MovieRepository>()));
  sl.registerLazySingleton(() => BrowseMoviesUseCase(sl<MovieRepository>()));

  sl.registerLazySingleton(() => GetUserProfileUseCase(sl<UserRepository>()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl<UserRepository>()));
  sl.registerLazySingleton(() => DeleteUserProfileUseCase(sl<UserRepository>()));

  sl.registerFactory(
    () => WatchListBloc(
      removeFromWatchList: sl<RemoveFromWatchListUseCase>(),
      getWatchList: sl<GetWatchListUseCase>(),
    ),
  );
  sl.registerFactory(() => MovieSearchBloc(sl<SearchMoviesUseCase>()));
  sl.registerFactory(() => MovieBrowseBloc(sl<BrowseMoviesUseCase>()));
  sl.registerFactory(
    () => HistoryBloc(
      addToHistory: sl<AddToHistoryUseCase>(),
      getHistory: sl<GetHistoryUseCase>(),
    ),
  );
  sl.registerFactory(
    () => UserProfileBloc(
      getUserProfile: sl<GetUserProfileUseCase>(),
      getHistoryUseCase: sl<GetHistoryUseCase>(),
      getWatchListUseCase: sl<GetWatchListUseCase>(),
      deleteProfileUseCase: sl<DeleteUserProfileUseCase>(),
      updateProfileUseCase: sl<UpdateProfileUseCase>(),
    ),
  );
  sl.registerFactory(
    () => DeleteProfileBloc(
      deleteProfileUseCase: sl<DeleteUserProfileUseCase>(),
    ),
  );
  sl.registerFactory(
    () => UpdateProfileBloc(
      updateProfileUseCase: sl<UpdateProfileUseCase>(),
    ),
  );
}
