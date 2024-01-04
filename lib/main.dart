import 'package:flutter/material.dart';
import 'functionalities/landingscreenlogic.dart';
import 'screens/landingscreenui.dart';
import 'package:deeply_us_project/neumorphismdesignfunctionality.dart';
import 'package:deeply_us_project/screens/signupscreen.dart';
import 'screens/signinscreen.dart';
import 'dailyQuestionWidgets/layout1.dart';
import 'dailyQuestionWidgets/layout2.dart';
import 'dailyQuestionWidgets/layout3.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: landingscreenui(),
    );
  }
}

