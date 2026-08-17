import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension BuildContextHelpers on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  StackRouter get router => AutoRouter.of(this);

  void pop<T extends Object?>([T? result]) => router.maybePop(result);
  Future<T?> push<T extends Object?>(PageRouteInfo route) => router.push<T>(route);
  Future<void> replace(PageRouteInfo route) => router.replace(route);
}