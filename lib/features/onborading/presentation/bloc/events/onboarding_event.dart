abstract class OnboardingEvent {}

class OnboardingLoadEvent extends OnboardingEvent {}

class OnboardingNextEvent extends OnboardingEvent {
  final int currentIndex;
  OnboardingNextEvent(this.currentIndex);
}