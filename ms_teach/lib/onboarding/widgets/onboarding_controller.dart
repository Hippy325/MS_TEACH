import 'package:flutter/material.dart';
import 'package:ms_teach/utilities/ui/custom_button.dart';

enum OnboardingControllerState { initial, success }

class OnboardingController extends StatelessWidget {
  final OnboardingControllerState state;
  final VoidCallback onContinue;

  const OnboardingController({
    super.key,
    required this.state,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mobile_friendly, size: 120),
            const SizedBox(height: 24),
            const Text(
              "Добро пожаловать",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Перед вашими глазами тестово приложение",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CustomButton(text: "Продолжить", onPressed: onContinue),
          ],
        ),
      ),
    );
  }
}
