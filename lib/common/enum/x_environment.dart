enum XEnvironment { prod, dev, stag, local }

extension XEnvironmentExtension on XEnvironment {
  String get getValue {
    switch (this) {
      case XEnvironment.prod:
        return 'prod';
      case XEnvironment.dev:
        return 'dev';
      case XEnvironment.stag:
        return 'stag';
      case XEnvironment.local:
        return 'local';
      default:
        return '';
    }
  }

  String get getFilePath {
    switch (this) {
      case XEnvironment.prod:
        return 'res/configuration/prod.json';
      case XEnvironment.dev:
        return 'res/configuration/dev.json';
      case XEnvironment.stag:
        return 'res/configuration/stag.json';
      case XEnvironment.local:
        return 'res/configuration/local.json';
      default:
        return '';
    }
  }
}
