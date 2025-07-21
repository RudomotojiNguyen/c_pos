import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../data/models/store_model.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../login/bloc/auth_bloc.dart';
import '../bloc/store_bloc.dart';

class FormCreateRequestExchangeStore extends StatefulWidget {
  const FormCreateRequestExchangeStore({super.key});

  @override
  State<FormCreateRequestExchangeStore> createState() =>
      _FormCreateRequestExchangeStoreState();
}

class _FormCreateRequestExchangeStoreState
    extends State<FormCreateRequestExchangeStore> {
  final AuthBloc _authBloc = getIt.get<AuthBloc>();
  final StoreBloc _storeBloc = getIt.get<StoreBloc>();

  final TextEditingController _descriptionController = TextEditingController();
  ValueNotifier<StoreModel?> selectedItemNotifier = ValueNotifier(null);

  @override
  void dispose() {
    selectedItemNotifier.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Tạo phiếu chuyển cửa hàng',
          style: AppFont.t.s(16).w700,
        ),
        BoxSpacer.s16,
        Expanded(
          child: Column(
            children: [
              _storeInfo(),
              BoxSpacer.s16,
              _description(),
            ],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: selectedItemNotifier,
          builder: (context, value, _) {
            return XButton(
              onPressed: value == null
                  ? null
                  : () {
                      _storeBloc.add(CreateTicketExchangeEvent(
                        targetStoreId: value.id!,
                        description: _descriptionController.text.trim(),
                      ));
                    },
              title: 'Tạo phiếu',
            );
          },
        )
      ],
    );
  }

  Widget _description() {
    return XTextField(
      minLines: 10,
      controller: _descriptionController,
      contentPadding: EdgeInsets.all(16.sp),
      labelText: 'Lý do chuyển của hàng',
      hintText: 'Nhập lý do',
    );
  }

  Widget _storeInfo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _currentStore(),
            BoxSpacer.s16,
            _targetStore(),
          ],
        ),
        Positioned(
          child: CircleAvatar(
            radius: 16.sp,
            backgroundColor: AppColors.warningColor,
            child: Icon(
              Icons.arrow_downward,
              size: 18.sp,
              color: AppColors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _currentStore() {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _authBloc,
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(16.sp),
            width: 240.sp,
            decoration: BoxDecoration(
              color: AppColors.disabledColor,
              borderRadius: BorderRadius.all(AppRadius.xxm),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cửa hàng hiện tại',
                  style: AppFont.t.s(),
                ),
                BoxSpacer.s4,
                Text(
                  state.getUserStoreName,
                  textAlign: TextAlign.start,
                  style: AppFont.t.s(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _targetStore() {
    return Align(
      alignment: Alignment.centerRight,
      child: BlocBuilder<StoreBloc, StoreState>(
        bloc: _storeBloc,
        buildWhen: (previous, current) => current is GetStoreSuccess,
        builder: (context, state) {
          return XBaseButton(
            baseButtonType: BaseButtonType.tapOperation,
            secondaryWidgetBuilder: (closeOverlay) => Container(
              height: 300.sp,
              width: 300.sp,
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final StoreModel store = state.stores[index];
                  return XBaseButton(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: Text(
                      store.getName,
                      style: AppFont.t.s(),
                    ),
                    onPressed: () async {
                      selectedItemNotifier.value = store;
                      await closeOverlay();
                    },
                  );
                },
                separatorBuilder: (context, index) => BoxSpacer.s2,
                itemCount: state.stores.length,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(16.sp),
              width: 240.sp,
              decoration: BoxDecoration(
                color: AppColors.disabledColor,
                borderRadius: BorderRadius.all(AppRadius.xxm),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Sang cửa hàng',
                          style: AppFont.t.s(),
                        ),
                        BoxSpacer.s4,
                        ValueListenableBuilder(
                            valueListenable: selectedItemNotifier,
                            builder: (context, value, _) {
                              return Text(
                                value?.getName ?? 'Chọn cửa hàng',
                                textAlign: TextAlign.end,
                                style: AppFont.t.s(),
                              );
                            }),
                      ],
                    ),
                  ),
                  BoxSpacer.s16,
                  Icon(
                    Icons.arrow_drop_down,
                    size: 18.sp,
                    color: AppColors.neutralColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
