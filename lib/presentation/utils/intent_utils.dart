import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IntentUtils {
  IntentUtils._();

  static Future<void> makePhoneCall(String phoneNumber) async {
    await launchUrl(Uri(
      scheme: 'tel',
      path: phoneNumber,
    ));
  }

  static Future<void> openWebLink(String link) async {
    if (await canLaunchUrlString(link)) {
      await launchUrlString(link);
    }
  }
}
