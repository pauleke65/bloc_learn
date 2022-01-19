import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(),
        );

      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
