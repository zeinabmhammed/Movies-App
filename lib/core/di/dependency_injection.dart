import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/network/dio_factory_auth.dart';
import '../../core/network/dio_factory_movies.dart';
import '../../core/network/api_manager.dart';
import '../../data/datasources/auth_remote_ds.dart';
import '../../data/datasources/auth_remote_ds_impl.dart';
import '../../data/datasources/history_local_ds.dart';
import '../../data/datasources/history_local_ds_impl.dart';
import '../../data/datasources/movies_remote_ds.dart';
import '../../data/datasources/movies_remote_ds_impl.dart';
import '../../data/datasources/onboarding_local_data_source.dart';
import '../../data/datasources/user_remote_ds.dart';
import '../../data/datasources/user_remote_ds_impl.dart';
import '../../data/datasources/watchList_local_ds.dart';
import '../../data/datasources/watchList_local_ds_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/history_repository_impl.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/repositories/watchList_repository_impl.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/history_repository.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/repositories/watchList_repository.dart';
import '../../domain/usecases/browse_movies.dart';
import '../../domain/usecases/get_onboarding_data_usecase.dart';
import '../../domain/usecases/historyusecases/add_to_history.dart';
import '../../domain/usecases/historyusecases/get_history.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/profileUsecases/delete_account.dart';
import '../../domain/usecases/profileUsecases/get_user_profile.dart';
import '../../domain/usecases/profileUsecases/update_profile.dart';
import '../../domain/usecases/register_uescase.dart';
import '../../domain/usecases/search_movies.dart';
import '../../domain/usecases/watchListUsecases/get_watchList.dart';
import '../../domain/usecases/watchListUsecases/remove_from_watchList.dart';
import '../../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../features/browse/presentation/bloc/movie_browse_bloc.dart';
import '../../features/onborading/presentation/bloc/blocs/onboarding_bloc.dart';
import '../../features/profile/presentation/bloc/deleteProfile/delete_profile_bloc.dart';
import '../../features/profile/presentation/bloc/history/history_bloc.dart';
import '../../features/profile/presentation/bloc/updateProfile/update_profile_bloc.dart';
import '../../features/profile/presentation/bloc/userProfile/user_profile_bloc.dart';
import '../../features/profile/presentation/bloc/watchList/watch_list_bloc.dart';
import '../../features/search/presentation/bloc/movie_search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);

  // Dio
  sl.registerLazySingleton<Dio>(
    () => DioFactoryAuth.createDio(),
    instanceName: "authDio",
  );
  sl.registerLazySingleton<Dio>(
    () => DioFactoryMovies.createDio(),
    instanceName: "movieDio",
  );

  // ApiManager
  sl.registerLazySingleton(
    () => ApiManager(
      dioAuth: sl<Dio>(instanceName: "authDio"),
      dioMovies: sl<Dio>(instanceName: "movieDio"),
    ),
  );

  // Onboarding
  sl.registerLazySingleton<OnboardingDataSource>(
    () => OnboardingLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<GetOnboardingDataUseCase>(
    () => GetOnboardingDataUseCase(sl()),
  );
  sl.registerFactory(() => OnboardingBloc(sl()));

  // Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerFactory(() => AuthBloc(loginUseCase: sl(), registerUseCase: sl()));

  // Movies, User, WatchList
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

  // Repositories
  sl.registerLazySingleton<WatchListRepository>(
    () => WatchListRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  sl.registerLazySingleton<HistoryRepository>(() => HistoryRepoImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => RemoveFromWatchListUseCase(sl()));
  sl.registerLazySingleton(() => GetWatchListUseCase(sl()));
  sl.registerLazySingleton(() => AddToHistoryUseCase(sl()));
  sl.registerLazySingleton(() => GetHistoryUseCase(sl()));
  sl.registerLazySingleton(() => SearchMoviesUseCase(sl()));
  sl.registerLazySingleton(() => BrowseMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetUserProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => DeleteUserProfileUseCase(sl()));

  // Blocs
  sl.registerFactory(
    () => WatchListBloc(removeFromWatchList: sl(), getWatchList: sl()),
  );
  sl.registerFactory(() => MovieSearchBloc(sl()));
  sl.registerFactory(() => MovieBrowseBloc(sl()));
  sl.registerFactory(() => HistoryBloc(addToHistory: sl(), getHistory: sl()));
  sl.registerFactory(
    () => UserProfileBloc(
      getUserProfile: sl(),
      getHistoryUseCase: sl(),
      getWatchListUseCase: sl(),
      deleteProfileUseCase: sl(),
      updateProfileUseCase: sl(),
    ),
  );
  sl.registerFactory(() => DeleteProfileBloc(deleteProfileUseCase: sl()));
  sl.registerFactory(() => UpdateProfileBloc(updateProfileUseCase: sl()));
}
