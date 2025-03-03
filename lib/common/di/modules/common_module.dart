import 'package:c_pos/common/configs/configurations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../presentation/common_bloc/network/internet_bloc.dart';
import '../../base/di_module.dart';
import '../injection/injection.dart';

class CommonModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton(() => Configurations())
      ..registerLazySingleton(() => InternetBloc(Connectivity()));
  }
}
