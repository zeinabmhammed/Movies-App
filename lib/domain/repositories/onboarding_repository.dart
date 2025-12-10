import '../../core/network/execute_api.dart';
import '../entities/onboarding_entity.dart';

abstract class OnboardingRepository {
  Future<Result<List<OnboardingEntity>>> getOnboardingData();
}