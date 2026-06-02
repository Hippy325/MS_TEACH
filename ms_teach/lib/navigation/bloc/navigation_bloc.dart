import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/utilities/shared/shared.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final Shared shared;

  NavigationBloc({required this.shared}) : super(NavigationInitial()) {
    on<NavigationOnCheckOnboarding>((event, emit) async {
      var onboardingShown = await shared.getOnboardingShown();
      if (onboardingShown) {
        var subscriptionActive = await shared.getSubscriptionActive();
        if (subscriptionActive) {
          emit(NavigationUpdated(initialRoute: InitialRoute.main));
        } else {
          emit(NavigationUpdated(initialRoute: InitialRoute.pawall));
        }
      } else {
        emit(NavigationUpdated(initialRoute: InitialRoute.onboarding));
      }
    });
  }
}
