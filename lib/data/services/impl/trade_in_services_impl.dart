part of '../trade_in_services.dart';

class TradeInServicesImpl extends TradeInServices {
  final TradeInApi tradeInApi;
  final FileApi fileApi;

  TradeInServicesImpl({
    required this.tradeInApi,
    required this.fileApi,
  });

  @override
  Future<List<TradeInModel>> getListTradeIn({
    required int page,
    required int limit,
    String? searchCustomer,
    String? fromDate,
    String? toDate,
    String? searchProduct,
  }) {
    return tradeInApi
        .getListTradeIn(
      page: page,
      limit: limit,
      searchCustomer: searchCustomer,
      fromDate: fromDate,
      toDate: toDate,
      searchProduct: searchProduct,
    )
        .then((value) {
      List<TradeInModel> data = [];

      for (var tradeIn in value.data['data']) {
        data.add(TradeInModel.fromJson(tradeIn));
      }

      return data;
    });
  }

  @override
  Future<TradeInModel> getTradeInDetail(int id) {
    return tradeInApi.getTradeInDetail(id).then((value) {
      return TradeInModel.fromJson(value.data);
    });
  }

  @override
  Future<List<ImageDetailModel>> getImageVerifyTradeIn(int id) async {
    final res = await fileApi.getFileList(
      entityId: id,
      entity: XEntityEnum.evaluationTrade.getValue,
    );

    List<ImageDetailModel> data = [];

    for (var image in res.data) {
      data.add(ImageDetailModel.fromJson(image));
    }

    return data;
  }

  @override
  Future getImageBase64(String fileName) {
    return fileApi.getImageBase64(filename: fileName);
  }

  @override
  Future<(bool, bool, ProductModel)> getProductByImei(String imei) {
    return tradeInApi.getProductByImei(imei: imei).then((value) {
      bool isEstimateCost = value.data['isEstimateCost'] ?? false;
      bool isSoldByCompany = value.data['isSoldByCompany'] ?? false;
      ProductModel product = value.data['product'] != null
          ? ProductModel.fromJson(value.data['product'])
          : ProductModel(productType: ProductType.normal);
      return (isEstimateCost, isSoldByCompany, product);
    });
  }

  @override
  Future<List<ProductModel>> getTradeInProductByName(String productName) {
    return tradeInApi.getTradeInProductByName(productName: productName).then((
      value,
    ) {
      List<ProductModel> products = [];
      for (var product in value.data) {
        products.add(ProductModel.fromJson(product));
      }
      return products;
    });
  }

  @override
  Future<TradeInProgramModel> getTradeInCriterion(String productId) {
    return tradeInApi.getTradeInCriterion(productId: productId).then((value) {
      return TradeInProgramModel.fromJson(value.data);
    });
  }

  @override
  Future<bool> saveBillTradeIn(Map<String, dynamic> params) {
    return tradeInApi.saveBillTradeIn(params).then((response) {
      return ((response.checkIsSuccess) || (response.data as bool));
    });
  }

  @override
  Future<BaseResponse> deleteImage({dynamic fileId, required int tradeInId}) {
    final body = {
      "modelName": XAssetModelName.tradeIn.getValue,
      "modelId": tradeInId
    };
    return fileApi.deleteFileAssetUsage(assetId: fileId.toString(), body: body);
  }

  @override
  Future<BaseFileModel?> uploadImage(
      {required XFile file, required int tradeInBillId}) async {
    MultipartFile image = await MultipartFile.fromFile(
      file.path,
      filename: file.name,
      contentType: DioMediaType.parse(file.mimeType ?? 'image/jpg'),
    );

    final formData = FormData.fromMap({'files': image});
    final res = await fileApi.postImage(
      formData: formData,
      modelId: tradeInBillId,
      modelName: XAssetModelName.tradeIn.getValue,
    );

    final images = res['images'] as List? ?? [];
    if (images.isNotEmpty) {
      final data = BaseFileModel.fromJson(images.first);
      data.mimeType = file.mimeType ?? 'image/jpg';
      return data;
    }

    return null;
  }

  @override
  Future<List<BaseFileModel>> getFileListAssetUsage(
      {required int modelId}) async {
    final res = await fileApi.getFileListAssetUsage(
        modelName: XAssetModelName.tradeIn.getValue, modelId: modelId);

    List<BaseFileModel> data = [];
    for (var file in res.getListDataAssetUsage) {
      data.add(BaseFileModel.fromJson(file));
    }
    return data;
  }
}
