import '../../core/network/execute_api.dart';
import '../entities/onboarding_entity.dart';

abstract class OnboardingRepository {
  // 💡 يجب أن يتطابق التوقيع مع ما يتم استدعاؤه في الـ Use Case
  Future<Result<List<OnboardingEntity>>> getOnboardingData();
}