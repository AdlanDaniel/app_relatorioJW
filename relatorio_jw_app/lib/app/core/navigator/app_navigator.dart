import 'package:flutter/material.dart';

class AppNavigator {
  static final global = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> navigator;

  final NavigatorObserver navigatorObserver;

  AppNavigator({
    required this.navigator,
    required this.navigatorObserver,
  });

  void pushNamed(
    String routeName, {
    String? originPage,
    Object? arguments,
    Map<String, dynamic>? defaultQueryParams,
  }) {
    if (defaultQueryParams != null || originPage != null) {
      var uri = Uri.parse(routeName);
      uri = uri.replace(
        queryParameters: {
          if (defaultQueryParams != null) ...defaultQueryParams,
          ...uri.queryParameters,
          if (originPage != null) 'originPage': originPage,
        },
      );
      routeName = uri.toString();
    }

    navigator.currentState!.pushNamed(routeName, arguments: arguments);
  }
}
