import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/paywal/bloc/paywall_bloc.dart';
import 'package:ms_teach/paywal/widgets/paywall_widget.dart';
import 'package:ms_teach/utilities/shared/shared_impl.dart';

class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PaywallBloc(shared: SharedImpl())..add(PaywallOnAppear()),
      child: const PaywallWidget(),
    );
  }
}
