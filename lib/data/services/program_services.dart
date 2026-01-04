import 'package:c_pos/data/models/models.dart';

import '../datasources/remote/program_api.dart';

part 'impl/program_services_impl.dart';

abstract class ProgramServices {
  Future<DiscountProgramModel?> checkProgramDiscount({
    required String productId,
    required int storeId,
    required List<String> productIds,
  });
}
