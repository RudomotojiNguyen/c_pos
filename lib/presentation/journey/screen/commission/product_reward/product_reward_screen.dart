import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/models.dart';
import '../../../../../data/models/reward_product_check_model.dart';
import '../../../../theme/themes.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/widgets.dart';
import '../../login/bloc/auth_bloc.dart';
import '../../search_product/bloc/search_product_bloc.dart';
import '../bloc/affiliate_bloc.dart';

part 'widgets/product_reward_item.dart';

class ProductRewardScreen extends StatefulWidget {
  const ProductRewardScreen({super.key});

  @override
  State<ProductRewardScreen> createState() => _ProductRewardScreenState();
}

class _ProductRewardScreenState extends XStateWidget<ProductRewardScreen> {
  final AffiliateBloc _affiliateBloc = getIt.get<AffiliateBloc>();
  final AuthModel? userInfo = getIt<AuthBloc>().state.userInfo;
  final SearchProductBloc searchProductBloc = getIt.get<SearchProductBloc>();
  final TextEditingController _searchController = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  late ValueNotifier<DateTime> _selectedTime;
  ProductModel? _selectedProduct;

  final _currentTime = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    _selectedTime = ValueNotifier(_currentTime);
    super.initState();
  }

  @override
  void dispose() {
    _selectedTime.dispose();
    _searchController.dispose();
    _timer?.cancel();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return XAppBar(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tra cứu cấu hình hoa hồng',
                style: AppFont.t.s().w600,
              ),
              _dateInfo(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Column(
      children: [
        _searchProduct(),
        Expanded(child: _buildListProduct()),
      ],
    );
  }

  ///
  /// WIDGET
  ///
  Widget _dateInfo() {
    return XBaseButton(
      onPressed: () async {
        final result = await Utils.selectMonthPicker(
          context,
          initialDate: _selectedTime.value,
          lastDate: DateTime(_currentTime.year,
              _currentTime.month), // xa nhất có thể chọn là tháng hiện tại
        );
        if (result != null) {
          _selectedTime.value = result;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: _selectedTime,
              builder: (context, value, child) {
                return Text(
                  DateFormat(XDateTimeEnum.monthYear.getValue).format(value),
                  style: AppFont.t.s().w600,
                );
              }),
          BoxSpacer.s8,
          Icon(
            Icons.keyboard_arrow_down,
            size: 12.sp,
            color: AppColors.neutralColor,
          ),
        ],
      ),
    );
  }

  Widget _searchProduct() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp).copyWith(bottom: 8.sp),
      color: AppColors.white,
      child: XTextField<ProductModel>(
        backgroundColor: AppColors.transparent,
        isEditMode: true,
        controller: _searchController,
        hintText: 'Tìm sản phẩm',
        onChanged: _onChangeText,
        onSelectData: _onSelectProduct,
        futureRequest: (value) async {
          return await _onSearchProduct(value);
        },
        itemSearchBuilder: (context, index, product) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.sp,
              vertical: 8.sp,
            ),
            child: Text.rich(
              TextSpan(
                text: product.getName,
                style: AppFont.t.s().w600,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListProduct() {
    return BlocBuilder<AffiliateBloc, AffiliateState>(
      bloc: _affiliateBloc,
      buildWhen: (previous, current) =>
          current is GetProductRewardSuccess ||
          current is GetCommissionDetailLoading,
      builder: (context, state) {
        final List<RewardProductCheckModel> rewardProductCheck =
            state is GetProductRewardSuccess ? state.rewardProductCheck : [];

        if (state is GetCommissionDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (rewardProductCheck.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Chưa có dữ liệu',
              ),
            ],
          );
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: const RefreshWidget(),
          onRefresh: () async {
            _refreshController.refreshCompleted();
            if (_selectedProduct != null) {
              _onGetData(_selectedProduct!);
            }
          },
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ProductRewardItem(
                rewardProductCheck: rewardProductCheck[index],
              );
            },
            itemCount: rewardProductCheck.length,
            separatorBuilder: (context, index) => BoxSpacer.s16,
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          ),
        );
      },
    );
  }

  ///
  /// METHOD
  ///
  _onChangeText(String? value) {
    if (_selectedProduct != null) {
      _selectedProduct = null;
      _affiliateBloc.add(ClearProductEvent());
    }
  }

  Future<List<ProductModel>> _onSearchProduct(String? value) async {
    // Hủy timer nếu đang chạy
    _timer?.cancel();

    final completer = Completer<List<ProductModel>>();

    _timer = Timer(const Duration(milliseconds: AppConstants.timeSearchValue),
        () async {
      final String textValue = _searchController.text.trim();

      if (textValue.isEmpty) {
        completer.complete(
            <ProductModel>[]); // Trả về danh sách rỗng nếu không có giá trị tìm kiếm
        return;
      }

      // Thực hiện tìm kiếm sản phẩm (giả sử gọi API hoặc query database)
      List<ProductModel> results = await _fetchProducts(textValue);

      completer.complete(results);
    });

    return completer.future;
  }

// Hàm giả lập lấy danh sách sản phẩm
  Future<List<ProductModel>> _fetchProducts(String query) async {
    final result = await searchProductBloc.getProducts(
      page: 1,
      limit: 5,
      param: query,
      type: SearchType.product,
    );
    return result.items;
  }

  _onSelectProduct(dynamic value) {
    final ProductModel product = value as ProductModel;
    _selectedProduct = product;
    _searchController.text = product.getName;
    //
    _onGetData(product);
  }

  _onGetData(ProductModel product) {
    _refreshController.refreshCompleted();
    _affiliateBloc.add(CheckCommissionEvent(
      productId: product.id!,
      storeId: userInfo!.getStoreId.toString(),
      month: _selectedTime.value.month.toString(),
      year: _selectedTime.value.year.toString(),
    ));
  }
}
