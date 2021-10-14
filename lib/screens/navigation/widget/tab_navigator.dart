import 'package:eazeal/config/app_router.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = "/";
  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItem item;
  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeBuilder = _routeBuilder();
    return Navigator(
      key: navigatorKey,
  
      initialRoute: tabNavigatorRoot,
      onGenerateRoute: AppRouter.onGenerateNestedRoute,
      
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
            settings: const RouteSettings(name: tabNavigatorRoot),
            builder: (context) => routeBuilder[initialRoute]!(context),
          ),
        ];
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilder() {
    return {tabNavigatorRoot: (context) => _getScreen(context, item)};
  }

  Widget _getScreen(BuildContext context, BottomNavItem item) {
    switch (item) {
      case BottomNavItem.home:
        return const HomeScreen();
      case BottomNavItem.search:
        return const SearchScreen();
      case BottomNavItem.cart:
        return const CartScreen();
      case BottomNavItem.profile:
        return const ProfileScreen();
      default:
        return const Scaffold();
    }
  }
}
