import 'package:deeply_us_project/controller/language_change_controller.dart';
import 'package:deeply_us_project/screens/dashboard_screen.dart';
import 'package:deeply_us_project/screens/home_screen.dart';
import 'package:deeply_us_project/screens/landing_screen_ui.dart';
import 'package:deeply_us_project/screens/sign_in_screen.dart';
import 'package:deeply_us_project/screens/sign_up_screen.dart';
import 'package:deeply_us_project/temp_files/localisation_temp.dart';
import 'package:deeply_us_project/temp_files/tempFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deeply_us_project/functionalities/screen_util_logic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString('language_code') ?? '';
  runApp(MyApp(locale: languageCode));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final controller = LanguageChangeController();
            controller.loadSavedLocale();
            return controller;
          },
        ),
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          if (provider.appLocale == null) {
            provider.changeLanguage(const Locale('en'));
          }
          return MaterialApp(
            locale: provider.appLocale ?? const Locale('en'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('es'),
            ],
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const LocalisationTempWidget(),
          );
        },
      ),
    );
  }
}


