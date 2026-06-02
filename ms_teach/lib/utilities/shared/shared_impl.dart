import 'package:ms_teach/utilities/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedImpl extends Shared {
  @override
  Future<void> setOnboardingShown(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboaarding', value);
  }

  @override
  Future<bool> getOnboardingShown() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboaarding') ?? false;
  }

  @override
  Future<void> setSubscriptionActive(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('subscription', value);
  }

  @override
  Future<bool> getSubscriptionActive() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('subscription') ?? false;
  }
}
