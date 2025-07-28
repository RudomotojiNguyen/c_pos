import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/customer_bloc.dart';
import 'widgets/customer_info.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends XStateWidget<CustomersScreen> {
  final CustomerBloc _customerBloc = getIt.get<CustomerBloc>();
  final TextEditingController _searchCustomerController =
      TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _customerBloc.add(GetCustomerByPhoneEvent(null));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Danh sách khách hàng',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Stack(
      children: [
        _listCustomer(),
        Positioned(
          bottom: 16.sp,
          left: 0,
          right: 0,
          child: SearchBoxWidget(
            hintStr: '0123456xxx',
            searchController: _searchCustomerController,
            onSearch: _onSearchCustomer,
          ),
        ),
      ],
    );
  }

  ///
  /// WIDGET
  ///
  Widget _listCustomer() {
    int crossAxisCount = context.isSmallScreen ? 1 : 2;
    return BlocBuilder<CustomerBloc, CustomerState>(
      bloc: _customerBloc,
      buildWhen: (previous, current) =>
          current is GetCustomersSuccess || current is UpdateIsLoading,
      builder: (context, state) {
        if (state is UpdateIsLoading) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
            itemBuilder: (context, index) {
              return const CustomerLoading();
            },
            separatorBuilder: (context, index) => BoxSpacer.s8,
            itemCount: 10,
          );
        }

        List<CustomerModel> customers = state.customers;
        if (customers.isEmpty) {
          String mess = _searchCustomerController.text.isEmpty
              ? ''
              : 'Không tìm thấy khách hàng';
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(emptyMessage: mess),
            ],
          );
        }
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: const RefreshWidget(),
          footer: const BottomLoadWidget(
            canLoadingStr: 'Vuốt để tìm thêm khách',
            noMoreStr: 'Đã hết dữ liệu',
          ),
          onRefresh: () async {
            _onSearchCustomer(_searchCustomerController.text);
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            _onLoadMoreCustomer();
          },
          child: SingleChildScrollView(
            child: XGridView(
              type: XGridViewType.aligned,
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16.sp,
              crossAxisSpacing: 16.sp,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
              itemCount: customers.length,
              itemBuilder: (context, index) {
                return CustomerInfo(customer: customers[index]);
              },
            ),
          ),
        );
      },
    );
  }

  ///
  /// METHOD
  ///
  _onSearchCustomer(String value) {
    _customerBloc.add(GetCustomerByPhoneEvent(value));
  }

  _onLoadMoreCustomer() {
    // _customerBloc.add(GetCustomerByPhoneEvent(null));
  }
}
