import '../../../../../domain/entities/onboarding_entity.dart';

// هذا الملف يحتوي على جميع الحالات التي يمكن أن تكون عليها شاشة الـ Onboarding
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingSuccess extends OnboardingState {
  final List<OnboardingEntity> data;
  final int currentPageIndex;

  OnboardingSuccess(this.data, this.currentPageIndex);
}

class OnboardingError extends OnboardingState {
  final String message;
  OnboardingError(this.message);
}