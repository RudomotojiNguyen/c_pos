import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'support_api.g.dart';

@RestApi()
abstract class SupportApi {
  factory SupportApi(Dio dio, {String baseUrl}) = _SupportApi;

  /// lấy danh sách phiếu yêu cầu hỗ trợ
  ///
  @GET('tickets')
  Future<BaseResponse> getTicketList({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('status') int? status,
    @Query('type') String? type,
  });

  /// lấy thông tin của 1 ticket
  ///
  @GET('tickets')
  Future<BaseResponse> getTicketDetail({@Query('id') required int id});

  /// lấy danh sách loại ticket hỗ trợ
  ///
  @GET('tickets/type')
  Future<BaseResponse> getTicketTypes({@Query('status') int? status});

  /// Gửi phiếu ticket đi
  ///
  @POST('tickets/create')
  Future<BaseResponse> saveSupportTicket(@Body() Map<String, dynamic> params);

  /// Nhắc xử lý phiếu
  /// params: {id: int}
  @POST('tickets/remind')
  Future<BaseResponse> remindTicket(@Body() Map<String, dynamic> params);
}
