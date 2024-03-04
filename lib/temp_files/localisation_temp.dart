import 'package:deeply_us_project/screens/landing_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deeply_us_project/controller/language_change_controller.dart';
import 'package:provider/provider.dart';
import '../screens/home_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';

class LocalisationTempWidget extends StatefulWidget {
  const LocalisationTempWidget({super.key});

  @override
  State<LocalisationTempWidget> createState() => _LocalisationTempWidgetState();
}

enum Language {english , spanish}

class _LocalisationTempWidgetState extends State<LocalisationTempWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Consumer<LanguageChangeController>(
            builder: (context , provider , child) {
              return PopupMenuButton(
                  onSelected: (Language item) {
                    if(Language.english.name == item.name)
                    {
                      provider.changeLanguage(const Locale('en'));
                    } else {
                      print('spanish');
                      provider.changeLanguage(const Locale('es'));
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                    const PopupMenuItem(
                        value: Language.english,
                        child: Text('English')),
                    const PopupMenuItem(
                        value: Language.spanish,
                        child: Text('Spanish'))
                  ]);
            },
          )
        ],
      ),
      body:  Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingScreenUi()),
              );
            }, child: Text('${AppLocalizations.of(context)!.clickHere} LandingScreen')),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreenPage()),
              );
            }, child: Text('${AppLocalizations.of(context)!.clickHere} HomeScreen')),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreenUi()),
              );
            }, child: Text('${AppLocalizations.of(context)!.clickHere} SignInScreen')),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpUiScreen()),
              );
            }, child: Text('${AppLocalizations.of(context)!.clickHere} SignUpScreen')),

          ],
        ),
      ),
    );
  }
}
