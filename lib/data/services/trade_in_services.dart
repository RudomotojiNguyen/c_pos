import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/enum/enum.dart';
import '../datasources/remote/api_remote.dart';
import '../models/base_file_model.dart';
import '../models/image_detail_model.dart';
import '../models/product_model.dart';
import '../models/response/base_response.dart';
import '../models/trade_in/trade_in_model.dart';
import '../models/trade_in/trade_in_program_model.dart';

part 'impl/trade_in_services_impl.dart';

abstract class TradeInServices {
  Future<List<TradeInModel>> getListTradeIn({
    required int page,
    required int limit,
    String? searchCustomer,
    String? fromDate,
    String? toDate,
    String? searchProduct,
  });

  Future<TradeInModel> getTradeInDetail(int id);

  Future<List<ImageDetailModel>> getImageVerifyTradeIn(int id);

  Future<dynamic> getImageBase64(String fileName);

  Future<(bool, bool, ProductModel)> getProductByImei(String imei);

  Future<List<ProductModel>> getTradeInProductByName(String productName);

  Future<TradeInProgramModel> getTradeInCriterion(String productId);

  Future<bool> saveBillTradeIn(Map<String, dynamic> params);

  Future<BaseResponse> deleteImage({dynamic fileId, required int tradeInId});

  Future<BaseFileModel?> uploadImage({
    required XFile file,
    required int tradeInBillId,
  });

  Future<List<BaseFileModel>> getFileListAssetUsage({required int modelId});
}
