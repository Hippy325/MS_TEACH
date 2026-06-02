import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/main/page/main_page.dart';
import 'package:ms_teach/navigation/bloc/navigation_bloc.dart';
import 'package:ms_teach/onboarding/page/onboarding_page.dart';
import 'package:ms_teach/paywal/page/paywall_page.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state.initialRoute == InitialRoute.onboarding) {
          return const OnboardingPage();
        } else if (state.initialRoute == InitialRoute.main) {
          return const MainPage();
        } else {
          return const PaywallPage();
        }
      },
    );
  }
}
