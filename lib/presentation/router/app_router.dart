import 'package:bloc_learn/business_logic/cubits/counter/counter_cubit.dart';
import 'package:bloc_learn/presentation/screens/home_screen.dart';
import 'package:bloc_learn/presentation/screens/second_screen.dart';
import 'package:bloc_learn/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
