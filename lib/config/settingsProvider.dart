import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsProvider {}

class SharedPrefsSettingsProvider extends SettingsProvider {
  final SharedPreferences _prefs;

  SharedPrefsSettingsProvider(this._prefs);
  static Future<SharedPrefsSettingsProvider> load() async {
    return SharedPrefsSettingsProvider(await SharedPreferences.getInstance());
  }
}
