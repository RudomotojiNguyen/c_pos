extension UriExtensions on Uri {
  String getDeepLink() {
    String strUri = '$path?$query';
    return strUri;
  }
}
