/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsConfigurationGen {
  const $AssetsConfigurationGen();

  /// File path: assets/configuration/dev.json
  String get dev => 'assets/configuration/dev.json';

  /// File path: assets/configuration/local.json
  String get local => 'assets/configuration/local.json';

  /// File path: assets/configuration/prod.json
  String get prod => 'assets/configuration/prod.json';

  /// File path: assets/configuration/staging.json
  String get staging => 'assets/configuration/staging.json';

  /// List of all assets
  List<String> get values => [dev, local, prod, staging];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/driver.json
  String get driver => 'assets/lottie/driver.json';

  /// File path: assets/lottie/empty_data.json
  String get emptyData => 'assets/lottie/empty_data.json';

  /// File path: assets/lottie/maintaine.json
  String get maintaine => 'assets/lottie/maintaine.json';

  /// File path: assets/lottie/notconnected.json
  String get notconnected => 'assets/lottie/notconnected.json';

  /// File path: assets/lottie/pickpackage.json
  String get pickpackage => 'assets/lottie/pickpackage.json';

  /// File path: assets/lottie/transfer.json
  String get transfer => 'assets/lottie/transfer.json';

  /// List of all assets
  List<String> get values =>
      [driver, emptyData, maintaine, notconnected, pickpackage, transfer];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/img_logo.svg
  SvgGenImage get imgLogo => const SvgGenImage('assets/svg/img_logo.svg');

  /// File path: assets/svg/ios-link.svg
  SvgGenImage get iosLink => const SvgGenImage('assets/svg/ios-link.svg');

  /// List of all assets
  List<SvgGenImage> get values => [imgLogo, iosLink];
}

class Assets {
  Assets._();

  static const $AssetsConfigurationGen configuration =
      $AssetsConfigurationGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
