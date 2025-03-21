import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../data/models/customer_model.dart';
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
    return Column(
      children: [
        SearchBoxWidget(
          hintStr: '0123456xxx',
          searchController: _searchCustomerController,
          onSearch: _onSearchCustomer,
        ),
        BoxSpacer.s8,
        Expanded(child: _listCustomer()),
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
      builder: (context, state) {
        if (state.isLoading) {
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
            // widget.orderBloc.add(GetOrderEvent());
            // _refreshController.refreshCompleted();
          },
          onLoading: () {
            // widget.orderBloc.add(GetMoreOrderEvent());
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
}
