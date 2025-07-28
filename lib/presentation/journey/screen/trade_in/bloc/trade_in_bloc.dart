import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
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

    /// tìm sản phẩm bằng imei
    on<SearchProductByImeiEvent>(_onSearchProductByImei);

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
      final res = await tradeInServices.getTradeInProductByName(event.name);
      emit(SearchProductsSuccess(state: state, products: res));
    } catch (e) {
      _loggerHelper.logError(message: 'SearchProductByNameEvent', obj: e);
      emit(SearchProductsSuccess(state: state, products: const []));
    }
  }

  FutureOr<void> _onSearchProductByImei(
      SearchProductByImeiEvent event, Emitter<TradeInState> emit) async {
    try {
      emit(IsCriteriaLoading(state: state));

      if (event.imei.isNullOrEmpty) {
        emit(GetProductByImeiSuccess(
          state: state,
          isEstimateCost: false,
          isSoldByCompany: false,
          product: null,
        ));
        return;
      }
      final res = await tradeInServices.getProductByImei(event.imei);
      emit(GetProductByImeiSuccess(
        state: state,
        isEstimateCost: res.$1,
        isSoldByCompany: res.$2,
        product: res.$3,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'SearchProductByImeiEvent', obj: e);
      XToast.showNegativeMessage(message: e.toString());
      emit(GetProductByImeiError(state: state));
    }
  }

  FutureOr<void> _onRemoveImageTradeIn(
      RemoveImageTradeInEvent event, Emitter<TradeInState> emit) async {
    List<ImageDetailModel> images = state is GetImageVerifySuccess
        ? (state as GetImageVerifySuccess).images
        : [];

    try {
      emit(IsCriteriaLoading(state: state));
      for (var i = 0; i < images.length; i++) {
        /// nếu như là hình từ server => goij api ,ngược lại thì xóa luôn
        if (shouldSetImageLocalToNull(
            image: images[i],
            index: i,
            imageIndex: event.index,
            uuid: event.uuid)) {
          if (images[i].checkHasData) {
            final res = await tradeInServices.deleteImage(images[i].id!);
            if (res.checkIsSuccess) {
              images[i].data = null;
            } else {
              XToast.showNegativeMessage(message: res.getMess);
            }
            break;
          }

          if (images[i].id == null) {
            images[i].imageLocal = null;
            break;
          }
        }
      }

      emit(GetImageVerifySuccess(state: state, images: images));
    } catch (e) {
      _loggerHelper.logError(message: 'RemoveImageTradeInEvent', obj: e);
      XToast.showNegativeMessage(message: e.toString());
      emit(GetImageVerifySuccess(state: state, images: images));
    }
  }

  FutureOr<void> _onUploadImageTradeIn(
      UploadImageTradeInEvent event, Emitter<TradeInState> emit) async {
    List<ImageDetailModel> images = state is GetImageVerifySuccess
        ? (state as GetImageVerifySuccess).images
        : [];

    try {
      emit(IsCriteriaLoading(state: state));
      final res = await tradeInServices.uploadImage(
          file: event.file, tradeInBillId: event.tradeInBillId);

      if (res.checkIsSuccess) {
        final data = res.data as List;
        final item = data.first;
        XToast.showPositiveSuccess(message: res.getMess);
        images[event.index]
          ..id = item['id']
          ..fileName = item['fileName'];
      } else {
        XToast.showNegativeMessage(message: res.getMess);
      }
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
    List<ImageDetailModel> images = state is GetImageVerifySuccess
        ? (state as GetImageVerifySuccess).images
        : [];

    try {
      emit(IsCriteriaLoading(state: state));
      for (var i = 0; i < images.length; i++) {
        if (shouldSetImageLocalToNull(
            image: images[i],
            index: i,
            imageIndex: event.index,
            uuid: event.uuid)) {
          images[i].imageLocal = event.value;
          break;
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
      List<ImageDetailModel> images =
          List.generate(2, (index) => ImageDetailModel());
      final res = await tradeInServices.getImageVerifyTradeIn(event.id);

      for (var i = 0; i < res.length; i++) {
        images[i]
          ..id = res[i].id
          ..uuid = Utils.genUUID()
          ..fileName = res[i].fileName;
      }

      // Tạo danh sách các Future để lấy dữ liệu base64 cho từng ảnh
      List<Future<void>> futures = images.map((image) {
        if (image.getFileName.isNotEmpty) {
          // Nếu fileName không rỗng, thực hiện API call
          return tradeInServices
              .getImageBase64(image.getFileName)
              .then((base64Data) {
            image.data = base64Data; // Gán dữ liệu base64 vào image
          });
        }
        // Nếu fileName rỗng, trả về một Future.completed
        return Future.value();
      }).toList();

      // Đợi tất cả các yêu cầu bất đồng bộ hoàn thành
      await Future.wait(futures);

      emit(GetImageVerifySuccess(state: state, images: images));
    } catch (e) {
      _loggerHelper.logError(message: 'GetImagesTradeInEvent', obj: e);
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

  bool shouldSetImageLocalToNull(
      {required ImageDetailModel image,
      String? uuid,
      required int index,
      required int imageIndex}) {
    return (uuid != null && image.uuid == uuid) || (imageIndex == index);
  }
}
