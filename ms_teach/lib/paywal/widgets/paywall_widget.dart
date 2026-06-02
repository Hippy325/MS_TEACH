import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/main/page/main_page.dart';
import 'package:ms_teach/paywal/widgets/plan_card.dart';
import 'package:ms_teach/utilities/show_error.dart';
import 'package:ms_teach/utilities/ui/custom_button.dart';
import 'package:ms_teach/utilities/ui/loading_indicator.dart';

import '../bloc/paywall_bloc.dart';

class PaywallWidget extends StatefulWidget {
  const PaywallWidget({super.key});

  @override
  State<PaywallWidget> createState() => _PaywallWidgetState();
}

class _PaywallWidgetState extends State<PaywallWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PaywallBloc, PaywallState>(
      listener: (context, state) {
        if (state is PaywallError) {
          showErrorAlert(context: context, error: state.error);
        }
        if (state is PaywallSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MainPage();
              },
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PaywallBloc, PaywallState>(
            builder: (context, state) {
              return LoadingIndicator(
                loading: state.loading == Loading.loading,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Выберите подписку',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 32),
                        ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PlanCard(
                              item: state.items[index],
                              onTap: () {
                                context.read<PaywallBloc>().add(
                                  PaywallSelectPlan(index),
                                );
                              },
                            );
                          },
                          separatorBuilder: (_, _) {
                            return const SizedBox(height: 16);
                          },
                          itemCount: state.items.length,
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          text: 'Продолжить',
                          onPressed: () {
                            context.read<PaywallBloc>().add(PaywallPurchase());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
