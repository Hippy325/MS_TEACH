import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/onboarding/bloc/onboarding_bloc.dart';
import 'package:ms_teach/onboarding/widgets/onboarding_widget.dart';
import 'package:ms_teach/utilities/shared/shared_impl.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(shared: SharedImpl()),
      child: const OnboardingWidget(),
    );
  }
}
