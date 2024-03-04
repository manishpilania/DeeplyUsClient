
import 'package:flutter/material.dart';
import '../../screens/dashboard_screen.dart';
import '../../screens/explore_screen.dart';
import '../../screens/history_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/landing_screen_ui.dart';
import '../../screens/sign_in_screen.dart';
import '../../screens/sign_up_screen.dart';
import 'routes_names.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case RoutesName.landing:
        return MaterialPageRoute(builder: (BuildContext context) => const LandingScreenUi());

      case RoutesName.history:
        return MaterialPageRoute(builder: (BuildContext context) => const HistoryScreen());

      case RoutesName.explore:
        return MaterialPageRoute(builder: (BuildContext context) => const ExploreScreen());

      case RoutesName.dashboard:
        return MaterialPageRoute(builder: (BuildContext context) => const DashboardScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreenPage());

      case RoutesName.signIn:
        return MaterialPageRoute(builder: (BuildContext context) => const SignInScreenUi());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpUiScreen());

      default:
        return MaterialPageRoute(builder: (_)
        {
          return const Scaffold(body: Center(
            child: Text('No route defined'),
          ),);
        }
        );
    }
  }
}
