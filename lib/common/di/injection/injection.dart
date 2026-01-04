import 'package:get_it/get_it.dart';

import '../modules/api_module.dart';
import '../modules/bloc_module.dart';
import '../modules/common_module.dart';
import '../modules/components_module.dart';
import '../modules/local_datasource_module.dart';
import '../modules/services_module.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static Future<void> inject() async {
    await CommonModule().provides();
    await LocalDataSourceModule().provides();
    await ComponentsModule().provides();
    await ApiModule().provides();
    await ServicesModule().provides();
    await BlocModule().provides();
  }
}
