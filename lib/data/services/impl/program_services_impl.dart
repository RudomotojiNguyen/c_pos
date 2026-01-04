part of '../program_services.dart';

class ProgramServicesImpl implements ProgramServices {
  final ProgramApi programApi;

  ProgramServicesImpl({required this.programApi});

  @override
  Future<DiscountProgramModel?> checkProgramDiscount({
    required String productId,
    required int storeId,
    required List<String> productIds,
  }) async {
    final res = await programApi.checkProgramDiscountOfProduct(
      productId: productId,
      storeId: storeId,
      productIds: productIds,
    );

    List<DiscountProgramModel> data = [];
    for (var item in (res.data ?? [])) {
      data.add(DiscountProgramModel.fromJson(item));
    }

    if (data.isEmpty) {
      return null;
    }

    return data.first;
  }
}
