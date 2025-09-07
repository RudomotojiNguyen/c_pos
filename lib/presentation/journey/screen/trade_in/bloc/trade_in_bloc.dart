import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../data/models/base_file_model.dart';
import '../../../../../data/services/services.dart';
import '../../../../mixins/logger_helper.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/widgets.dart';

part 'trade_in_event.dart';
part 'trade_in_state.dart';

class TradeInBloc extends Bloc<TradeInEvent, TradeInState> {
  final TradeInServices tradeInServices;
  final LoggerHelper _loggerHelper = LoggerHelper();

  TradeInBloc({
    required this.tradeInServices,
  }) : super(TradeInInitial(
          tradeIns: const [],
          pageInfoEntity: PageInfoEntity(),
          filterInfo: const FilterTradeInModel(),
          tradeInProgramCriteriaGroup: const [],
        )) {
    /// cập nhật filter
    on<UpdateFilterEvent>(_onUpdateFilter);

    /// cập nhật text search
    on<OnChangeTextSearchEvent>(_onChangeTextSearchEvent);

    /// set filter mặc định
    on<SetDefaultFilter>(_onSetDefault);

    /// lấy danh sách định giá
    on<GetTradeInDataEvent>(_onGetTradeInBill);

    /// lấy thêm danh sách định giá
    on<GetMoreTradeInDataEvent>(_onGetMoreTradeInData);

    /// lấy thông tin chi tiết phiếu định giá
    on<GetTradeInDataDetailEvent>(_onGetTradeInDataDetail);

    /// lấy danh sách hình xác thực
    on<GetImagesTradeInEvent>(_onGetImagesTradeIn);

    /// tìm theo tên sản phẩm
    on<SearchProductByNameEvent>(_onSearchProductByName);

    /// lấy chương trình định giá sản phẩm
    on<GetTradeInCritrtionEvent>(_onGetTradeInCritrtion);

    ///
    on<UpdateImageTradeInEvent>(_onUpdateImageTradeIn);

    ///
    on<RemoveImageTradeInEvent>(_onRemoveImageTradeIn);

    ///
    on<UploadImageTradeInEvent>(_onUploadImageTradeIn);
  }

  FutureOr<void> _onGetTradeInCritrtion(
      GetTradeInCritrtionEvent event, Emitter<TradeInState> emit) async {
    try {
      emit(IsCriteriaLoading(state: state));
      final res = await tradeInServices.getTradeInCriterion(event.productId);
      emit(GetProgramCriteriaSuccess(
          state: state,
          tradeInProgramCriteriaGroup: res.tradeInProgramCriteriaGroup ?? []));
    } catch (e) {
      _loggerHelper.logError(message: 'GetTradeInCritrtionEvent', obj: e);
      emit(GetProgramCriteriaError(state: state));
    }
  }

  FutureOr<void> _onSearchProductByName(
      SearchProductByNameEvent event, Emitter<TradeInState> emit) async {
    try {
      emit(IsCriteriaLoading(state: state));
      if (event.name.isNullOrEmpty) {
        emit(SearchProductsSuccess(state: state, products: const []));
        return;
      }

      emit(IsCriteriaLoading(state: state));
      final res = await tradeInServices.getTradeInProductByName(event.name);
      emit(SearchProductsSuccess(state: state, products: res));
    } catch (e) {
      _loggerHelper.logError(message: 'SearchProductByNameEvent', obj: e);
      emit(SearchProductsSuccess(state: state, products: const []));
    }
  }

  FutureOr<void> _onRemoveImageTradeIn(
      RemoveImageTradeInEvent event, Emitter<TradeInState> emit) async {
    Map<String, ImageDetailModel> images = state is GetImageVerifySuccess
        ? (state as GetImageVerifySuccess).images
        : {};

    try {
      emit(IsCriteriaLoading(state: state));

      /// nếu như là hình từ server => goij api ,ngược lại thì xóa luôn
      final ImageDetailModel? image = images[event.uuid];

      if (image == null) {
        emit(GetImageVerifySuccess(state: state, images: images));
        return;
      }

      if (image.id != null) {
        final res = await tradeInServices.deleteImage(
            fileId: image.id, tradeInId: event.tradeInId);
        if (!res.checkIsSuccess) {
          XToast.showNegativeMessage(message: res.getMess);
          emit(GetImageVerifySuccess(state: state, images: images));
          return;
        }
      }

      // xóa hình
      images.remove(image.uuid!);

      emit(GetImageVerifySuccess(state: state, images: images));
    } catch (e) {
      _loggerHelper.logError(message: 'RemoveImageTradeInEvent', obj: e);
      XToast.showNegativeMessage(message: e.toString());
      emit(GetImageVerifySuccess(state: state, images: images));
    }
  }

  FutureOr<void> _onUploadImageTradeIn(
      UploadImageTradeInEvent event, Emitter<TradeInState> emit) async {
    Map<String, ImageDetailModel> images = state is GetImageVerifySuccess
        ? (state as GetImageVerifySuccess).images
        : {};

    try {
      emit(IsCriteriaLoading(state: state));
      final BaseFileModel? res = await tradeInServices.uploadImage(
          file: event.file, tradeInBillId: event.tradeInBillId);

      if (res != null) {
        final Uint8List? dataImage = await urlToUint8List(res.url ?? '');
        images[event.uuid] = ImageDetailModel(
          id: res.id,
          fileName: res.name ?? res.originalName,
          data: dataImage,
          uuid: event.uuid,
        );
        XToast.showPositiveSuccess(message: 'Gửi hình thành công');
      } else {
        XToast.showNegativeMessage(message: 'Chưa thể gửi hình');
      }
      emit(GetImageVerifySuccess(state: state, images: images));
    } catch (e) {
      _loggerHelper.logError(message: 'UploadImageTradeInEvent', obj: e);
      XToast.showNegativeMessage(message: e.toString());
    } finally {
      emit(GetImageVerifySuccess(state: state, images: images));
      // add(GetImagesTradeInEvent(event.tradeInBillId));
    }
  }

  FutureOr<void> _onUpdateImageTradeIn(
      UpdateImageTradeInEvent event, Emitter<TradeInState> emit) async {
    Map<String, ImageDetailModel> images = state is GetImageVerifySuccess
        ? (state as GetImageVerifySuccess).images
        : {};

    try {
      emit(IsCriteriaLoading(state: state));
      if (event.uuid.isNullOrEmpty) {
        // thêm mới
        String uuid = Utils.genUUID();
        images[uuid] = ImageDetailModel(
          imageLocal: event.value,
          uuid: uuid,
        );
      } else {
        // cập nhật
        if (images[event.uuid!] != null) {
          images[event.uuid!]!.imageLocal = event.value;
        }
      }

      emit(GetImageVerifySuccess(state: state, images: images));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateImageTradeInEvent', obj: e);
      emit(GetImageVerifySuccess(state: state, images: images));
    }
  }

  FutureOr<void> _onGetImagesTradeIn(
      GetImagesTradeInEvent event, Emitter<TradeInState> emit) async {
    try {
      emit(IsCriteriaLoading(state: state));
      Map<String, ImageDetailModel> images = {};
      final res =
          await tradeInServices.getFileListAssetUsage(modelId: event.id);

      final imageList = await Future.wait(res.map((file) async {
        final data = await urlToUint8List(file.url ?? '');
        String uuid = Utils.genUUID();
        return ImageDetailModel(
          id: file.id,
          fileName: file.name,
          uuid: uuid,
          data: data,
        );
      }).toList());

      images = {
        for (var img in imageList) img.uuid!: img,
      };

      emit(GetImageVerifySuccess(state: state, images: images));
    } catch (e) {
      _loggerHelper.logError(message: 'GetImagesTradeInEvent', obj: e);
      emit(GetImageVerifySuccess(state: state, images: const {}));
    }
  }

  FutureOr<void> _onUpdateFilter(
      UpdateFilterEvent event, Emitter<TradeInState> emit) async {
    try {
      emit(UpdateFilterSuccess(
        state: state,
        filterInfo: state.filterInfo.copyWith(
          fromDate: event.fromDate,
          toDate: event.toDate,
          searchType: event.searchType,
          searchValue: event.searchValue,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateFilterEvent', obj: e);
    }
  }

  FutureOr<void> _onChangeTextSearchEvent(
      OnChangeTextSearchEvent event, Emitter<TradeInState> emit) async {
    try {
      emit(UpdateFilterSuccess(
        state: state,
        filterInfo: state.filterInfo.updateSearchText(
          searchValue: event.searchValue,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'OnChangeTextSearchEvent', obj: e);
    }
  }

  FutureOr<void> _onSetDefault(
      SetDefaultFilter event, Emitter<TradeInState> emit) async {
    try {
      emit(UpdateDefaultFilterSuccess(
          state: state, filterInfo: const FilterTradeInModel()));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateFilterEvent', obj: e);
    }
  }

  FutureOr<void> _onGetTradeInBill(
      GetTradeInDataEvent event, Emitter<TradeInState> emit) async {
    try {
      emit(IsCriteriaLoading(state: state));

      final res = await tradeInServices.getListTradeIn(
        page: 1,
        limit: state.pageInfoEntity.getLimit,
        toDate: state.filterInfo.getToDateValue,
        fromDate: state.filterInfo.getFromDateValue,
        searchProduct: state.filterInfo.getSearchProduct,
        searchCustomer: state.filterInfo.getSearchCustomer,
      );

      emit(GetTradeInDataSuccess(
        state: state,
        tradeIns: res,
        pageInfoEntity: state.pageInfoEntity.copyWith(
          page: 1,
          hasNextPage: res.length == state.pageInfoEntity.getLimit,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetTradeInDataEvent', obj: e);
      emit(IsCriteriaError(state: state, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onGetMoreTradeInData(
      GetMoreTradeInDataEvent event, Emitter<TradeInState> emit) async {
    try {
      if (state is IsLoadMore) {
        return;
      }

      int page = state.pageInfoEntity.getNextPage;
      List<TradeInModel> data = state.tradeIns;

      emit(IsLoadMore(state: state));
      final res = await tradeInServices.getListTradeIn(
        page: page,
        limit: state.pageInfoEntity.getLimit,
        toDate: state.filterInfo.getToDateValue,
        fromDate: state.filterInfo.getFromDateValue,
        searchProduct: state.filterInfo.getSearchProduct,
        searchCustomer: state.filterInfo.getSearchCustomer,
      );
      data.addAll(res);

      emit(GetTradeInDataSuccess(
        state: state,
        tradeIns: data,
        pageInfoEntity: state.pageInfoEntity.copyWith(
          page: page,
          hasNextPage: res.length == state.pageInfoEntity.getLimit,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetMoreTradeInDataEvent', obj: e);
    }
  }

  FutureOr<void> _onGetTradeInDataDetail(
      GetTradeInDataDetailEvent event, Emitter<TradeInState> emit) async {
    try {
      emit(IsCriteriaLoading(state: state));
      final res = await tradeInServices.getTradeInDetail(event.id);
      emit(GetTradeInDetailSuccess(state: state, tradeIndDetail: res));
    } catch (e) {
      emit(GetDetailError(state: state));
      _loggerHelper.logError(message: 'GetTradeInDataDetailEvent', obj: e);
    }
  }

  ///

  Future<Uint8List?> urlToUint8List(String url) async {
    try {
      final response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.data);
      } else {
        return null;
      }
    } on DioException catch (_) {
      return null;
    }
  }
}
