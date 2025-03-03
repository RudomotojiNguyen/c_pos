import 'package:c_pos/common/configs/configurations.dart';

import '../../../data/datasources/local_data/local_storage.dart';
import '../../base/di_module.dart';
import '../../network/interceptor/network_interceptor.dart';
import '../injection/injection.dart';

class ComponentsModule extends DIModule {
  @override
  Future<void> provides() async {
    Configurations coreConfiguration = getIt.get<Configurations>();

    getIt.registerLazySingleton(() => NetworkInterceptor(
          storage: getIt.get<LocalStorage>(),
          baseReadUrl: coreConfiguration.baseReadUrl,
          baseWriteUrl: coreConfiguration.baseWriteUrl,
          deviceType: coreConfiguration.deviceType,
          environment: coreConfiguration.environment,
          version: coreConfiguration.version,
        ));
  }
}
