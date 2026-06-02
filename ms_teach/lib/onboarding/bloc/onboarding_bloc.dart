import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/utilities/shared/shared.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final Shared shared;

  OnboardingBloc({required this.shared}) : super(OnboardingInitial()) {
    on<OnboardingOnContinue>((event, emit) {
      shared.setOnboardingShown(true);
      emit(OnboardingSuccess());
    });
  }
}
