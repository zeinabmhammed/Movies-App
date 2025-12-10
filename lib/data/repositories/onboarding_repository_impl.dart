import '../../core/network/execute_api.dart';
import '../../domain/entities/onboarding_entity.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_data_source.dart';

// 💡 هذا الكلاس ينفذ العقد (OnboardingRepository) باستخدام LocalDataSource
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingDataSource localDataSource;

  // يتم حقن LocalDataSource هنا
  OnboardingRepositoryImpl(this.localDataSource);

  @override
  Future<Result<List<OnboardingEntity>>> getOnboardingData() async {
    // 💡 نستخدم executeApi لتغليف جلب البيانات في صيغة Result<T> (Success/Failure)
    return await executeApi<List<OnboardingEntity>>(() async {
      // يتم تفويض طلب البيانات إلى الـ LocalDataSource
      return localDataSource.getOnboardingData();
    });
  }
}