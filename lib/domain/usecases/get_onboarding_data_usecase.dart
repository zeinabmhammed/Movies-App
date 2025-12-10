import '../../core/network/execute_api.dart'; // لتحديد نوع Result<T>
import '../entities/onboarding_entity.dart';
import '../repositories/onboarding_repository.dart'; // يعتمد على الواجهة

class GetOnboardingDataUseCase {
  final OnboardingRepository repository;

  // 💡 يقوم باستقبال الـ Repository (عقد البيانات)
  GetOnboardingDataUseCase(this.repository);

  // دالة call() هي التي ينفذها الـ Bloc
  Future<Result<List<OnboardingEntity>>> call() {
    return repository.getOnboardingData();
  }
}