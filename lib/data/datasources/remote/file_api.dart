import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'file_api.g.dart';

@RestApi()
abstract class FileApi {
  factory FileApi(Dio dio, {String baseUrl}) = _FileApi;

  /// đẩy hình trade in lên server
  @POST('file/upload')
  Future<BaseResponse> postImage({
    @Body() required FormData formData,
    @Query('entity') required String entity,
    @Query('entityId') required int entityId,
  });

  /// đẩy hình lên server
  @POST('file/upload-resize-image')
  Future<BaseResponse> postImageResize({
    @Body() required FormData formData,
    @Query('entity') required String entity,
    @Query('entityId') required int entityId,
  });

  /// đẩy hình ticket lên server
  @POST('file/upload-image')
  Future<BaseResponse> postImageTicket({
    @Body() required FormData formData,
    @Query('entity') required String entity,
  });

  /// Get file list
  /// - entityId: bill id, tradein id, ...
  /// - entity: bills, transactions, bills-invoices, purchase-orders, orders, stock-slips, evaluation-trade, import-trade-in, ticket
  @GET('file')
  Future<BaseResponse> getFileList({
    @Query('entity') required String entity,
    @Query('entityId') required int entityId,
  });

  /// lấy hình base64
  ///
  @GET('file/download')
  @Headers({"responseType": ResponseType.bytes})
  @DioResponseType(ResponseType.bytes)
  Future<dynamic> getImageBase64({@Query('filename') required String filename});

  /// xóa hình ảnh
  ///
  @DELETE('file/{fileId}')
  Future<BaseResponse> deleteImage(@Path() int fileId);
}
