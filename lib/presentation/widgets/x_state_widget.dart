import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

abstract class XStateWidget<T extends StatefulWidget> extends State<T>
    with RouteAware {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryLightColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: buildAppBar(context),
        body: buildContentView(context),
        bottomNavigationBar: buildBottomNavigationBar(context),
        floatingActionButton: buildFloatingActionButton(context),
      ),
    );
  }

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget buildFloatingActionButton(BuildContext context) => Container();

  Size get device => context.device;

  MediaQueryData get mediaQuery => context.mediaQuery;

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
    super.dispose();
  }
}
