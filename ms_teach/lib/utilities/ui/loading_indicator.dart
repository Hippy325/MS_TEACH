import 'package:flutter/material.dart';
import 'package:ms_teach/utilities/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final bool? initialLoading;
  final bool? loading;
  final Widget child;

  const LoadingIndicator({
    super.key,
    this.initialLoading,
    this.loading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (initialLoading == true) {
      return _myCircularProgressIndicator();
    } else {
      return Stack(
        children: [
          Opacity(opacity: loading == true ? 0.5 : 1.0, child: child),
          if (loading == true)
            AbsorbPointer(
              absorbing: true, // Блокируем все взаимодействия
              child: Container(color: Colors.transparent),
            ),
          if (loading == true) _myCircularProgressIndicator(),
        ],
      );
    }
  }

  Widget _myCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
        strokeWidth: 2,
      ),
    );
  }
}
