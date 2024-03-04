import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController extends ChangeNotifier {
  Locale? _appLocale;

  Locale? get appLocale => _appLocale;

  Future<void> changeLanguage(Locale newLocale) async {
    _appLocale = newLocale;
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('language_code', newLocale.languageCode);
    notifyListeners();
  }

  Future<void> loadSavedLocale() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? languageCode = sp.getString('language_code');
    if (languageCode != null && languageCode.isNotEmpty) {
      _appLocale = Locale(languageCode);
    }
    notifyListeners();
  }
}
