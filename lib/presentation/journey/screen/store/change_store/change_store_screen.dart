import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_constants.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../mixins/dialog_mixins.dart';
import '../../../../theme/themes.dart';
import '../../login/bloc/auth_bloc.dart';
import '../bloc/store_bloc.dart';
import '../widgets/form_create_request_exchange_store.dart';
import '../widgets/list_ticket_change.dart';
import '../widgets/stores_of_user.dart';
import '../../../../widgets/widgets.dart';

class ChangeStoreScreen extends StatefulWidget {
  const ChangeStoreScreen({super.key});

  @override
  State<ChangeStoreScreen> createState() => _ChangeStoreScreenState();
}

class _ChangeStoreScreenState extends XStateWidget<ChangeStoreScreen>
    with DialogHelper {
  int currentIndex = 0;
  List<TabData> tabs = [
    TabData(
      index: 1,
      title: const Tab(text: 'Cửa hàng'),
      content: const StoresOfUser(),
    ),
    TabData(
      index: 2,
      title: const Tab(text: 'Phiếu chuyển cửa hàng'),
      content: const ListTicketChange(),
    ),
  ];
  final StoreBloc _storeBloc = getIt.get<StoreBloc>();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Chuyển cửa hàng',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Scaffold(
      body: BlocListener<StoreBloc, StoreState>(
        bloc: _storeBloc,
        listener: (context, state) {
          if (state is ChangeUserStoreSuccess) {
            XToast.closeAllLoading();
            XToast.showPositiveSuccess(message: 'Đã chuyển cửa hàng của bạn');
            getIt.get<AuthBloc>().add(LogoutEvent());
          }
          if (state is CreateTicketExchangeSuccess) {
            XToast.closeAllLoading();
            Navigator.pop(context);
            XToast.showPositiveSuccess(
                message: 'Đã tạo thành công, hãy chờ duyệt phiếu');
            _storeBloc.add(GetExchangeHistoryEvent());
          }
        },
        child: DynamicTabBarWidget(
          dynamicTabs: tabs,
          isScrollable: true,
          onTabControllerUpdated: (controller) {
            controller.index = currentIndex;
          },
          onTabChanged: (index) {
            currentIndex = index ?? 0;
          },
          showBackIcon: false,
          showNextIcon: false,
          indicatorColor: AppColors.primaryColor,
          automaticIndicatorColorAdjustment: true,
          indicatorWeight: 4.sp,
          dividerColor: Colors.transparent,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.neutralColor,
          tabAlignment: TabAlignment.center,
        ),
      ),
      floatingActionButton: XBaseButton(
        onPressed: _onCreateTicketExchageStore,
        child: CircleAvatar(
          radius: 18.sp,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  ///
  /// METHOD
  ///
  _onCreateTicketExchageStore() {
    showXBottomSheet(
      context,
      key: GlobalAppKey.formCreateRequestExchangeStoreKey,
      body: const FormCreateRequestExchangeStore(),
    );
  }
}
