import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsProvider {
  double getBalance();
  Future<void> setBalance(double amount);
}

class SharedPrefsSettingsProvider extends SettingsProvider {
  final SharedPreferences _prefs;

  SharedPrefsSettingsProvider(this._prefs);
  static Future<SharedPrefsSettingsProvider> load() async {
    return SharedPrefsSettingsProvider(await SharedPreferences.getInstance());
  }

  @override
  double getBalance() {
    return _prefs.getDouble("BALANCE") ?? 0;
  }

  @override
  Future<void> setBalance(double amount) async {
    await _prefs.setDouble("BALANCE", amount);
  }
}
