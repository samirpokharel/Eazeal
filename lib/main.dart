import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'package:eazeal/config/configs.dart';
import 'package:eazeal/utils/utils.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:eazeal/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Preferences.preferences = RxSharedPreferences.getInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: watch(navigationProvider).navigatorKey,
      theme: ThemeUtils.light(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Wrapper.routeName,
    );
  }
}
