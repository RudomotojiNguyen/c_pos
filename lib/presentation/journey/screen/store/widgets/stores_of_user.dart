import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../gen/gen.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../login/bloc/auth_bloc.dart';
import '../bloc/store_bloc.dart';

class StoresOfUser extends StatefulWidget {
  const StoresOfUser({super.key});

  @override
  State<StoresOfUser> createState() => _StoresOfUserState();
}

class _StoresOfUserState extends State<StoresOfUser>
    with AutomaticKeepAliveClientMixin {
  final StoreBloc _storeBloc = getIt.get<StoreBloc>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  int get userCurrentStoreId => getIt.get<AuthBloc>().state.getUserStoreId;

  @override
  void initState() {
    super.initState();
    _storeBloc.add(GetUserStoreCanChangeEvent());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<StoreBloc, StoreState>(
      bloc: _storeBloc,
      buildWhen: (previous, current) =>
          current is GetUserStoreCanChangeLoading ||
          current is GetUserStoreCanChangeSuccess,
      builder: (context, state) {
        if (state is GetUserStoreCanChangeLoading) {
          return const UserStoreExchangeLoading();
        }
        List<StoreModel> data = (state is GetUserStoreCanChangeSuccess)
            ? state.userStoresCanChange
            : [];
        if (data.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                  emptyMessage:
                      'Hiện tại bạn không có cửa hàng nào có thể chuyển ngay'),
            ],
          );
        }
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: const RefreshWidget(),
          onRefresh: () async {
            _storeBloc.add(GetUserStoreCanChangeEvent());
            _refreshController.refreshCompleted();
          },
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
            itemBuilder: (context, index) {
              final StoreModel store = data[index];
              return UserStoreExchangeItem(
                store: store,
                onExchange: userCurrentStoreId == store.getStoreId
                    ? null
                    : () {
                        _storeBloc.add(ChangeUserStoreEvent(
                            targetStoreId: store.getStoreId));
                      },
              );
            },
            itemCount: data.length,
            separatorBuilder: (context, index) => BoxSpacer.s16,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class UserStoreExchangeItem extends StatelessWidget {
  const UserStoreExchangeItem(
      {super.key, required this.store, this.onExchange});

  final StoreModel store;
  final Function()? onExchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      child: Row(
        children: [
          Assets.svg.imgLogo.svg(
            width: 56.sp,
            height: 56.sp,
          ),
          BoxSpacer.s16,
          Expanded(
            child: Text(
              store.getName,
              style: AppFont.t.s(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (onExchange != null) ...[
            BoxSpacer.s16,
            XButton(
              onPressed: onExchange,
              title: 'Chuyển',
              textStyle: AppFont.t.s().white,
            ),
          ],
        ],
      ),
    );
  }
}
