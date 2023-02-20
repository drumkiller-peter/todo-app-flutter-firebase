import 'package:flutter/material.dart';

class NavigatorService {
  final _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  NavigatorState get navigator => _navigatorKey.currentState!;
  BuildContext? get context => _navigatorKey.currentState!.context;
}
