// هذا الملف يحتوي على جميع الأحداث التي يمكن أن تحدث في الـ Onboarding
abstract class OnboardingEvent {}

class OnboardingLoadEvent extends OnboardingEvent {}

class OnboardingNextEvent extends OnboardingEvent {
  final int currentIndex;
  OnboardingNextEvent(this.currentIndex);
}