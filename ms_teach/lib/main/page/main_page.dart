import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/main/bloc/main_bloc.dart';
import 'package:ms_teach/main/widgets/main_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc()..add(MainOnAppear()),
      child: const MainWidget(),
    );
  }
}
