import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/navigation/bloc/navigation_bloc.dart';
import 'package:ms_teach/navigation/widget/navigation_widget.dart';
import 'package:ms_teach/utilities/shared/shared_impl.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NavigationBloc(shared: SharedImpl())
            ..add(NavigationOnCheckOnboarding()),
      child: const NavigationWidget(),
    );
  }
}
