import 'dart:developer';

import 'package:bloc_learn/business_logic/cubits/counter/counter_cubit.dart';
import 'package:bloc_learn/presentation/router/app_router.dart';
import 'package:bloc_learn/presentation/screens/home_screen.dart';
import 'package:bloc_learn/presentation/screens/second_screen.dart';
import 'package:bloc_learn/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: _appRouter.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
    );
  }
}
