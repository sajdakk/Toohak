import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class NavigationManager extends NavigatorObserver {
  final BehaviorSubject<String?> _currentRouteName$ = BehaviorSubject<String?>.seeded(null);

  ValueStream<String?> get currentRoute {
    return _currentRouteName$;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setCurrentRoute(route);

    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setCurrentRoute(previousRoute);

    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  }) {
    _setCurrentRoute(newRoute);

    super.didReplace(
      newRoute: newRoute,
      oldRoute: oldRoute,
    );
  }

  void _setCurrentRoute(Route<dynamic>? route) {
    final String? routeName = route?.settings.name;

    _currentRouteName$.add(routeName);
  }
}
