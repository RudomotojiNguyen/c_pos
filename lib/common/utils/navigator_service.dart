import 'package:flutter/material.dart';

class NavigatorService {
  NavigatorService._();

  static final NavigatorService _instance = NavigatorService._();

  static NavigatorService get instance => _instance;

  static final _scaffoldMessengerStateKey = GlobalKey<ScaffoldMessengerState>();
  final navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerState =>
      _scaffoldMessengerStateKey;

  BuildContext? get context => navigatorKey.currentContext;
}
