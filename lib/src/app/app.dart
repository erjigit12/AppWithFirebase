import 'package:flutter/material.dart';

import '../modules/profile/views/profile_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routeInformationParser: _appRouter.defaultRouteParser(),
      // routerDelegate: _appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: false,
      ),
      home: const ProfileView(),
    );
  }
}
