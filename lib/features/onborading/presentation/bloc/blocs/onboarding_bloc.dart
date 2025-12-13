import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/network/execute_api.dart';
import '../../../../../domain/entities/onboarding_entity.dart';
import '../../../../../domain/usecases/get_onboarding_data_usecase.dart';
import '../events/onboarding_event.dart';
import '../states/onboarding_state.dart';


class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetOnboardingDataUseCase getOnboardingDataUseCase;

  final PageController pageController;

  OnboardingBloc(this.getOnboardingDataUseCase)
      : pageController = PageController(),
        super(OnboardingInitial()) {

    on<OnboardingLoadEvent>(_onLoadEvent);
    on<OnboardingNextEvent>(_onNextEvent);
  }


  Future<void> _onLoadEvent(
      OnboardingLoadEvent event,
      Emitter<OnboardingState> emit,
      ) async {
    emit(OnboardingLoading());
    final result = await getOnboardingDataUseCase.call();

    if (result is Success<List<OnboardingEntity>>) {
      emit(OnboardingSuccess(result.data, 0));
    } else if (result is Failure<List<OnboardingEntity>>) {
      emit(OnboardingError(result.message));
    }
  }

  Future<void> _onNextEvent(
      OnboardingNextEvent event,
      Emitter<OnboardingState> emit,
      ) async {
    if (state is OnboardingSuccess) {
      final currentState = state as OnboardingSuccess;
      final nextIndex = event.currentIndex + 1;

      if (nextIndex < currentState.data.length) {
        pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        emit(OnboardingSuccess(currentState.data, nextIndex));
      }
    }
  }

  void onPageChanged(int index) {
    if (state is OnboardingSuccess) {
      final currentState = state as OnboardingSuccess;
      emit(OnboardingSuccess(currentState.data, index));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}