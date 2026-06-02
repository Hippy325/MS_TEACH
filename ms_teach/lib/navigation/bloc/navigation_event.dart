part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigationOnCheckOnboarding extends NavigationEvent {}