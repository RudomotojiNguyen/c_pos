import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../gen/gen.dart';
import '../enum/enum.dart';

class Configurations {
  XEnvironment _env = XEnvironment.prod;

  /// device
  AndroidDeviceInfo? androidDeviceInfo;
  IosDeviceInfo? iosDeviceInfo;
  bool isPhysical = true;

  String _environment = '';
  String _baseReadUrl = '';
  String _baseWriteUrl = '';
  String _version = '';
  String _s3BaseUrl = '';
  String? _deepLink;
  String deviceType = '2';

  Future<void> setConfigurationValues() async {
    switch (appFlavor) {
      case 'prod':
        _env = XEnvironment.prod;
        break;
      case 'stag':
        _env = XEnvironment.stag;
        break;
      case 'dev':
        _env = XEnvironment.dev;
        break;
      default:
        _env = XEnvironment.prod;
        break;
    }

    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      if (Platform.isIOS) {
        iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        isPhysical = iosDeviceInfo!.isPhysicalDevice;
      }
      if (Platform.isAndroid) {
        androidDeviceInfo = await deviceInfoPlugin.androidInfo;
        isPhysical = androidDeviceInfo!.isPhysicalDevice;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> setUrlConfig() async {
    String response = '';

    switch (_env) {
      case XEnvironment.prod:
        response = await rootBundle.loadString(Assets.configuration.prod);
      case XEnvironment.stag:
        response = await rootBundle.loadString(Assets.configuration.staging);
      case XEnvironment.dev:
        response = await rootBundle.loadString(Assets.configuration.dev);
    }

    final data = await json.decode(response);

    _environment = data['environment'] ?? '';
    _version = data['version'] ?? '';
    _baseReadUrl = data['baseUrlWrite'] ?? '';
    _baseWriteUrl = data['baseUrlWrite'] ?? '';
    _s3BaseUrl = data['s3BaseUrl'] ?? '';
  }

  setDeepLink(String? value) => _deepLink = value;

  String get environment => _environment;

  String get baseWriteUrl => _baseWriteUrl;

  String get baseReadUrl => _baseReadUrl;

  String get version => _version;

  bool get isProduct => true;
  // bool get isProduct => _env == XEnvironment.prod;

  bool get isAnalyticAndCrashlytic => false;

  String? get getDeepLink => _deepLink;

  String get s3BaseUrl => _s3BaseUrl;
}
