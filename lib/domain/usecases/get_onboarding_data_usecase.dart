import '../../core/network/execute_api.dart'; // لتحديد نوع Result<T>
import '../entities/onboarding_entity.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingDataUseCase {
  final OnboardingRepository repository;

  GetOnboardingDataUseCase(this.repository);

  Future<Result<List<OnboardingEntity>>> call() {
    return repository.getOnboardingData();
  }
}