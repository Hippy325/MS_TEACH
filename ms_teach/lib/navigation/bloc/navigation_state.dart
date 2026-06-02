part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  final InitialRoute initialRoute;

  const NavigationState({required this.initialRoute});

  @override
  List<Object?> get props => [initialRoute];
}

enum InitialRoute { onboarding, main, pawall }

class NavigationInitial extends NavigationState {
  const NavigationInitial() : super(initialRoute: InitialRoute.onboarding);
}

class NavigationUpdated extends NavigationState {
  const NavigationUpdated({required super.initialRoute});
}
