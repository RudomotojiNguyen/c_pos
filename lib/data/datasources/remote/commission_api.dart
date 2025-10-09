import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'commission_api.g.dart';

@RestApi()
abstract class CommissionApi {
  factory CommissionApi(Dio dio, {String baseUrl}) = _CommissionApi;

  /// lấy danh sách chi tiết hoa hồng của nhân viên
  ///
  @GET('v1/reward-reports/mobile')
  Future<BaseResponse> getCommissionDetail({
    @Query('fromDate') required String fromDate,
    @Query('toDate') required String toDate,
  });

  /// lấy chi tiết hoa hồng của nhân viên theo mục được chọn
  ///
  @GET('rewardReport/mobile/details')
  Future<BaseResponse> getCommissionDetailByCate({
    @Query('fromDate') required String fromDate,
    @Query('toDate') required String toDate,
    @Query('roleId') required int roleId,
    @Query('ids') required String ids,
  });

  /// kiểm tra xem sản phẩm có được cấu hình hoa hồng không
  ///  productId:
  ///  storeId:
  ///  month:
  ///  year:
  @GET('v1/reward-reports/check')
  Future<BaseResponse> checkCommission({
    @Query('productId') required String productId,
    @Query('storeId') required String storeId,
    @Query('month') required String month,
    @Query('year') required String year,
  });
}
