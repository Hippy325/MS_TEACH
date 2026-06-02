import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_teach/main/bloc/main_bloc.dart';
import 'package:ms_teach/main/widgets/main_list_view_cell.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsetsGeometry.only(left: 8, right: 8, top: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Hello World",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == state.items.length) {
                          return const SizedBox(height: 16);
                        }
                        return MainListViewCell(item: state.items[index]);
                      },
                      separatorBuilder: (_, _) {
                        return const SizedBox(height: 12);
                      },
                      itemCount: state.items.length + 1,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
