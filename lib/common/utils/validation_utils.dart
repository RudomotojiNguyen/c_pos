mixin class ValidationHelper {
  static bool isValidEmail(String email) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return _matcher(pattern, email);
  }

  static bool isValidIdentifyNumber(String identifyNumber) {
    const pattern = r'[a-zA-Z0-9]{8,12}$';
    return _matcher(pattern, identifyNumber);
  }

  static bool isValidatePhoneNumber(String phoneNumber) {
    const pattern = r'(^[0-9]{9,11}$)';
    // const pattern = r'(^(?:[+0]9)?[0-9]{9,10,11}$)';
    final regExp = RegExp(pattern);
    if (phoneNumber.isEmpty) {
      return false;
    }
    return regExp.hasMatch(phoneNumber);
  }

  /// https://stackoverflow.com/questions/12018245/regular-expression-to-validate-username
  static bool isValidUserName(String userName) {
    const pattern = r'^(?=[a-zA-Z0-9._]{4,30}$)(?!.*[_.]{2})[^_.].*[^_.]$';
    return _matcher(pattern, userName);
  }

  static bool _matcher(String pattern, String value) {
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool isValidUrl(String url) {
    const pattern = r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
    return _matcher(pattern, url);
  }

  static bool validateDOB(String value) {
    const pattern = r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$';
    return _matcher(pattern, value);
  }

  static bool checkIsImageNetWork(String path) {
    RegExp regex = RegExp(r'^https?://');
    return regex.hasMatch(path);
  }

  static bool checkIsNumber(String path) {
    RegExp regex = RegExp(r'^[0-9]+(\.[0-9]+)?$');
    return regex.hasMatch(path);
  }
}
