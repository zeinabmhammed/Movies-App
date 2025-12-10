import '../../core/network/execute_api.dart';
import '../../domain/entities/onboarding_entity.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingDataSource localDataSource;

  OnboardingRepositoryImpl(this.localDataSource);

  @override
  Future<Result<List<OnboardingEntity>>> getOnboardingData() async {
    return await executeApi<List<OnboardingEntity>>(() async {
      return localDataSource.getOnboardingData();
    });
  }
}