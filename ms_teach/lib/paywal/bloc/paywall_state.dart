part of 'paywall_bloc.dart';

enum Loading { loading }

abstract class PaywallState extends Equatable {
  final Loading? loading;
  final List<PlanItem> items;

  const PaywallState({required this.loading, required this.items});

  @override
  List<Object?> get props => [loading, items];
}

class PaywallInitial extends PaywallState {
  const PaywallInitial({required super.loading, required super.items});
}

class PaywallUpdated extends PaywallState {
  const PaywallUpdated({required super.loading, required super.items});
}

class PaywallSuccess extends PaywallState {
  const PaywallSuccess({required super.loading, required super.items});
}

class PaywallError extends PaywallState {
  final String error;

  const PaywallError({
    required super.loading,
    required super.items,
    required this.error,
  });

  @override
  List<Object?> get props => [super.props, error];
}
