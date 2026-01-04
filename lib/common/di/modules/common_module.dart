import 'package:c_pos/common/configs/configurations.dart';

import '../../base/di_module.dart';
import '../injection/injection.dart';

class CommonModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerLazySingleton(() => Configurations());

    await getIt.get<Configurations>().init();
  }
}
