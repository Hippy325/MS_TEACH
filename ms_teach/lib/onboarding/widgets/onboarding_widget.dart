import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/paywal/page/paywall_page.dart';

import '../bloc/onboarding_bloc.dart';
import 'onboarding_controller.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return PaywallPage();
              },
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return OnboardingController(
                state: _controllerState(state),
                onContinue: () {
                  context.read<OnboardingBloc>().add(OnboardingOnContinue());
                },
              );
            },
          ),
        ),
      ),
    );
  }

  OnboardingControllerState _controllerState(OnboardingState state) {
    if (state is OnboardingSuccess) {
      return OnboardingControllerState.success;
    }

    return OnboardingControllerState.initial;
  }
}
