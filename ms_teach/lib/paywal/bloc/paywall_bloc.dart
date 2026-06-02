import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/paywal/models/plan_item.dart';
import 'package:ms_teach/paywal/models/subscription_plan.dart';
import 'package:ms_teach/utilities/shared/shared.dart';

part 'paywall_event.dart';
part 'paywall_state.dart';

class PaywallBloc extends Bloc<PaywallEvent, PaywallState> {
  Loading? loading;
  String? error;
  final Shared shared;
  List<PlanItem> items = [
    PlanItem(title: 'Monthly Plan', price: '\$4.99/month'),
    PlanItem(title: 'Yearly Plan', price: '\$49.99/year', badge: 'Скидка 33%'),
  ];

  SubscriptionPlan selectedPlan = SubscriptionPlan.year;

  PaywallBloc({required this.shared})
    : super(const PaywallInitial(items: [], loading: null)) {
    on<PaywallOnAppear>((event, emit) {
      _update(emit);
    });
    on<PaywallSelectPlan>((event, emit) {
      if (items[event.index].selected) {
        return;
      }
      items = items
          .map((item) => item.copyWith(selected: item == items[event.index]))
          .toList();
      _update(emit);
    });
    on<PaywallPurchase>((event, emit) async {
      if (items.every((item) => !item.selected)) {
        emit(
          PaywallError(
            loading: loading,
            items: items,
            error: 'Подписка не выбрана. Пожалуйста, выберите план.',
          ),
        );
        return;
      }
      loading = Loading.loading;
      _update(emit);
      await shared.setSubscriptionActive(true);
      await Future.delayed(const Duration(seconds: 2));
      loading = null;

      emit(PaywallSuccess(loading: loading, items: items));
    });
  }

  void _update(Emitter<PaywallState> emit) {
    emit(PaywallUpdated(loading: loading, items: items));
  }
}
