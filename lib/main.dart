import 'package:eazeal/config/Router/app_router.dart';
import 'package:eazeal/config/constants.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:eazeal/screens/splash/splash_screens.dart';
import 'package:eazeal/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ProviderScope(
      child: MaterialApp(
        title: appName,
        navigatorKey: watch(navigationProvider).navigatorKey,
        theme: ThemeUtils.light(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
