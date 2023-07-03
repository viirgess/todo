import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  setPreference(String key, dynamic value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  getPreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }

  clearData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
