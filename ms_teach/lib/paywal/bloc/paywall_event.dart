part of 'paywall_bloc.dart';

abstract class PaywallEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaywallOnAppear extends PaywallEvent {}

class PaywallSelectPlan extends PaywallEvent {
  final int index;

  PaywallSelectPlan(this.index);

  @override
  List<Object?> get props => [index];
}

class PaywallPurchase extends PaywallEvent {}
