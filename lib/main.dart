import 'utils/app_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'business_logic/cubits/internet/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubits/counter/counter_cubit.dart';
import 'presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  final observer = AppBlocObserver();

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    )),
    storage: storage,
    blocObserver: observer,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  final AppRouter appRouter;
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider(
          create: (context) => CounterCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: appRouter.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
      ),
    );
  }
}
