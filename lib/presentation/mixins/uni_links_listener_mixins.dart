import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:app_links/app_links.dart';

import '../utils/utils.dart';

abstract class UniLinksCallback {
  void onUniLink(Uri uri);

  void getInitUri(Uri? uri);
}

mixin UniLinksListenerMixin<T extends StatefulWidget> on State<T>
    implements UniLinksCallback {
  StreamSubscription? _sub;

  final appLinks = AppLinks();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    closeUniLinks();
    super.dispose();
  }

  Future<void> initUniLinks() async {
    _sub = appLinks.uriLinkStream.listen((Uri? uri) {
      // Use the uri and warn the user, if it is not correct
      if (uri != null) {
        debugPrint('initUniLinks: $uri');
        onUniLink(uri);
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });
  }

  void closeUniLinks() {
    if (_sub != null) {
      _sub!.cancel();
      _sub = null;
    }
  }

  Future<void> getInitUniLinks() async {
    // Uri parsing may fail, so we use a try/catch FormatException.
    try {
      final initialUri = await appLinks.getInitialLink();
      // Use the uri and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      if (!Utils.checkDataIsNullOrEmpty(initialUri)) {
        debugPrint('getInitUniLinks: $initialUri');
        getInitUri(initialUri);
      }
    } on FormatException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }
}
