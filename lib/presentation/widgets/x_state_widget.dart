import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../theme/colors.dart';

abstract class XStateWidget<T extends StatefulWidget> extends State<T>
    with RouteAware {
  late StreamSubscription<bool> _keyboardSubscription;

  // late final AnalyticsUtils analyticsUtils;

  @override
  void initState() {
    super.initState();
    // analyticsUtils = getIt.get<AnalyticsUtils>();
    final keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) {
        context.hideKeyboard;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: buildAppBar(context),
        body: buildContentView(context),
        bottomNavigationBar: buildBottomNavigationBar(context),
        floatingActionButton: buildFloatingActionButton(context),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Color backgroundColor({Color? color}) => color ?? AppColors.primaryLightColor;

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget buildFloatingActionButton(BuildContext context) => Container();

  Size get device => context.device;

  MediaQueryData get mediaQuery => context.mediaQuery;

  ThemeData get theme => context.theme;

  bool get resizeToAvoidBottomInset => true;

  Widget buildContentView(BuildContext context) => const Center(
        child: Text('Build your layout'),
      );

  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @override
  void didPush() {}

  @override
  void didPopNext() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _keyboardSubscription.cancel();
    super.dispose();
  }
}
