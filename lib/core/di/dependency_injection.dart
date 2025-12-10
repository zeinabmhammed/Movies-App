import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/auth_remote_ds.dart';
import '../../data/datasources/auth_remote_ds_impl.dart';
import '../../data/datasources/onboarding_local_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../../domain/usecases/get_onboarding_data_usecase.dart'; // الكلاس المطلوب
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_uescase.dart';
import '../../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../features/onborading/presentation/bloc/onboarding_bloc.dart';
import '../network/api_manager.dart';
import '../network/doi_factory.dart';

final instance = GetIt.instance;

Future<void> initDi() async {
  instance.registerLazySingleton<Dio>(() => DioFactory.createDio());

  instance.registerLazySingleton<OnboardingDataSource>(
          () => OnboardingLocalDataSourceImpl());

  instance.registerLazySingleton<OnboardingRepository>(
          () => OnboardingRepositoryImpl(instance()));

  instance.registerLazySingleton<GetOnboardingDataUseCase>(
          () => GetOnboardingDataUseCase(instance()));

  instance.registerFactory<OnboardingBloc>(
          () => OnboardingBloc(instance()));

  instance.registerLazySingleton(() => ApiManager());

    instance.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(instance()));

  instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));

  instance.registerLazySingleton<RegisterUseCase>(
          () => RegisterUseCase(instance()));

  instance.registerFactory<AuthBloc>(() =>
      AuthBloc(
          loginUseCase: instance(),
          registerUseCase: instance(),
          ));
}
