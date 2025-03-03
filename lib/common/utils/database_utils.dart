import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseUtil {
  static Future<void> initDatabase() async {
    try {
      if (!kIsWeb) {
        final directory = await getApplicationDocumentsDirectory();
        await Hive.initFlutter(directory.path);
      } else {
        await Hive.initFlutter();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///  Register our auto generated Adapter to our Hive database
  static void registerAdapter<Type>(TypeAdapter<Type> adapter) {
    try {
      Hive.registerAdapter(adapter);
    } on HiveError catch (error) {
      debugPrint('>>>>>>> Local Database: $error');
    }
  }

  /// All data stored in Hive is organized in boxes.
  /// A box can be compared to a table in SQL
  /// but it does not have a structure and can contain anything.
  /// Open a box to perform any operation
  static Future<Box<Type>> getBox<Type>(
      {required String boxName, bool isEncrypted = true}) async {
    return Hive.openBox(boxName);
  }

  /// To remove all local storage content.
  static Future<void> clearDatabase() async {
    await Hive.deleteFromDisk();
  }
}
