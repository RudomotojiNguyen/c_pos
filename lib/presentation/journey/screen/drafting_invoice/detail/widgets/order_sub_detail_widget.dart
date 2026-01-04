part of '../drafting_detail_screen.dart';

class OrderSubDetailWidget extends StatefulWidget {
  const OrderSubDetailWidget({super.key});

  @override
  State<OrderSubDetailWidget> createState() => _OrderSubDetailWidgetState();
}

class _OrderSubDetailWidgetState extends State<OrderSubDetailWidget> {
  final GlobalCoreBloc _mainBloc = getIt.get<GlobalCoreBloc>();
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  /// mã vận đơn
  final TextEditingController _deliveryCodeController = TextEditingController();

  /// nguồn đơn
  final TextEditingController _orderSourceController = TextEditingController();
  BaseEnumModel? orderSourceSelected;

  /// loại đơn
  final TextEditingController _orderTypeController = TextEditingController();
  BaseEnumModel? orderTypeSelected;

  /// trạng thái đơn
  final TextEditingController _orderStatusController = TextEditingController();
  BaseEnumModel? orderStatusSelected;

  /// ngày đến cửa hàng
  final ValueNotifier<List<DateTime?>?> datesComeToStore = ValueNotifier(null);

  /// ngày thanh toán
  final ValueNotifier<List<DateTime?>?> datesPayment = ValueNotifier(null);

  /// thời gian đến cửa hàng
  final ValueNotifier<TimeOfDay?> timeComeToStore = ValueNotifier(null);

  OrderSubDetailModel get orderSubDetail =>
      _draftingInvoiceBloc.state.orderSubDetail ?? OrderSubDetailModel();

  @override
  void initState() {
    super.initState();
    initData(_draftingInvoiceBloc.state.orderSubDetail);
  }

  @override
  void dispose() {
    _deliveryCodeController.dispose();
    _orderSourceController.dispose();
    _orderTypeController.dispose();
    _orderStatusController.dispose();
    datesComeToStore.dispose();
    datesPayment.dispose();
    timeComeToStore.dispose();
    super.dispose();
  }

  initData(OrderSubDetailModel? orderSubDetail) {
    _deliveryCodeController.text = orderSubDetail?.shipCode ?? '';
    //
    _orderSourceController.text = orderSubDetail?.orderSource?.getName ?? '';
    orderSourceSelected = orderSubDetail?.orderSource;
    //
    _orderTypeController.text = orderSubDetail?.orderType?.getName ?? '';
    orderTypeSelected = orderSubDetail?.orderType;
    //
    _orderStatusController.text = orderSubDetail?.orderStatus?.getName ?? '';
    orderStatusSelected = orderSubDetail?.orderStatus;
    //
    datesComeToStore.value = [orderSubDetail?.dateComeToShop];
    datesPayment.value = [orderSubDetail?.datePayFor];
    //timeComeToStore ở controller là TimeOfDay, timeComToShop ở localDB là DateTime -> phải parse về đúng dạng hiển thị
    timeComeToStore.value =
        orderSubDetail?.timeComToShop?.convertDateTimeToTimeOfDay();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      listener: (context, state) {
        if (state is GetCurrentDraftDataSuccess) {
          initData(state.orderSubDetail);
        }
      },
      buildWhen: (previous, current) =>
          current is GetCurrentDraftDataSuccess ||
          current is IsGettingDetail ||
          current is UpdateCustomerSuccess ||
          current is UpdateProductsSuccess,
      builder: (context, state) {
        if ((state.customer != null &&
                state.customer!.getCustomerPhone.isNotEmpty) &&
            (state.products ?? []).isNotEmpty) {
          return XContainer(
            margin: EdgeInsets.only(top: 16.sp),
            iconTitle: Icon(Icons.receipt_long,
                size: 18.sp, color: AppColors.neutral3Color),
            title: 'Nội dung đơn',
            child: Column(
              children: [
                if ({CartType.order, CartType.updateOrder}
                    .contains(state.cartType)) ...[
                  _dateComeToShop(),
                  BoxSpacer.s16,
                  _timeComeToShop(),
                  BoxSpacer.s16,
                  _datePayFor(),
                  BoxSpacer.s16,
                  _codeDelivery(),
                  BoxSpacer.s16,
                  _orderType(),
                  BoxSpacer.s16,
                  _orderStatus(),
                  BoxSpacer.s16,
                  _orderSource(),
                ],
              ],
            ),
          );
        }

        return BoxSpacer.blank;
      },
    );
  }

  ///
  /// WIDGET
  ///
  Widget _dateComeToShop() {
    return ValueListenableBuilder(
        valueListenable: datesComeToStore,
        builder: (context, value, _) {
          return XTextField(
            labelText: 'Ngày nhận',
            hintText: 'Chọn ngày',
            textInputStyle: TextInputStyle.selectSingleDate,
            dates: value,
            onResultDateSelect: (List<DateTime?>? dates) {
              datesComeToStore.value = dates;
              if ((dates ?? []).isNotEmpty) {
                _draftingInvoiceBloc.add(
                  UpdateOrderSubDetailEvent(
                    data: orderSubDetail.copyWith(dateComeToShop: dates!.first),
                  ),
                );
              }
            },
          );
        });
  }

  Widget _timeComeToShop() {
    return ValueListenableBuilder(
        valueListenable: timeComeToStore,
        builder: (context, value, _) {
          return XTextField(
            labelText: 'Thời gian nhận',
            hintText: 'Chọn giờ',
            textInputStyle: TextInputStyle.selectTime,
            time: value,
            onResultTimeSelect: (time) {
              timeComeToStore.value = time;
              _draftingInvoiceBloc.add(
                UpdateOrderSubDetailEvent(
                  data: orderSubDetail.copyWith(
                      timeComToShop: time?.convertTimeOfDayToDateTime()),
                ),
              );
            },
          );
        });
  }

  Widget _datePayFor() {
    return ValueListenableBuilder(
        valueListenable: datesPayment,
        builder: (context, value, _) {
          return XTextField(
            labelText: 'Ngày trả tiền',
            hintText: 'Chọn ngày',
            textInputStyle: TextInputStyle.selectSingleDate,
            dates: value,
            onResultDateSelect: (List<DateTime?>? dates) {
              datesPayment.value = dates;
              if ((dates ?? []).isNotEmpty) {
                _draftingInvoiceBloc.add(
                  UpdateOrderSubDetailEvent(
                    data: orderSubDetail.copyWith(datePayFor: dates!.first),
                  ),
                );
              }
            },
          );
        });
  }

  Widget _codeDelivery() {
    return XTextField(
      labelText: 'Mã vận đơn',
      hintText: 'CBHJD.......',
      controller: _deliveryCodeController,
      onChanged: (value) {
        _draftingInvoiceBloc.add(
          UpdateOrderSubDetailEvent(
            data: orderSubDetail.copyWith(shipCode: value),
          ),
        );
      },
    );
  }

  Widget _orderSource() {
    return BlocSelector<GlobalCoreBloc, GlobalCoreState, List<BaseEnumModel>>(
      bloc: _mainBloc,
      selector: (state) => state.orderSource,
      builder: (context, state) {
        return XTextField<BaseEnumModel>(
          controller: _orderSourceController,
          labelText: 'Nguồn đơn',
          isRequired: true,
          hintText: 'Chọn nguồn đơn',
          onChanged: (String? value) {
            if (orderSourceSelected != null) {
              orderSourceSelected = null;
              _draftingInvoiceBloc.add(
                UpdateOrderSubDetailEvent(
                  data: orderSubDetail.updateOrderSource(orderSource: null),
                ),
              );
            }
          },
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onSelectData: (dynamic result) {
            final data = result as BaseEnumModel;
            _orderSourceController.text = data.getName;
            orderSourceSelected = data;
            _draftingInvoiceBloc.add(
              UpdateOrderSubDetailEvent(
                data: orderSubDetail.updateOrderSource(orderSource: data),
              ),
            );
          },
          initItems: state,
          validator: (value) {
            if (orderSourceSelected == null) {
              return 'Vui lòng chọn nguồn đơn';
            }
            return null;
          },
          itemSearchBuilder: (context, index, data) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 8.sp,
              ),
              child: Text.rich(
                TextSpan(
                  text: data.getName,
                  style: AppFont.t.s(),
                ),
              ),
            );
          },
          futureRequest: (value) async {
            return await _mainBloc.searchOrderSource(value);
          },
        );
      },
    );
  }

  Widget _orderType() {
    return BlocSelector<GlobalCoreBloc, GlobalCoreState, List<BaseEnumModel>>(
      bloc: _mainBloc,
      selector: (state) => state.orderType,
      builder: (context, state) {
        return XTextField<BaseEnumModel>(
          controller: _orderTypeController,
          labelText: 'Loại đơn',
          isRequired: true,
          hintText: 'Chọn loại đơn',
          onChanged: (String? value) {
            if (orderTypeSelected != null) {
              orderTypeSelected = null;
              _draftingInvoiceBloc.add(
                UpdateOrderSubDetailEvent(
                  data: orderSubDetail.updateOrderType(orderType: null),
                ),
              );
            }
          },
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onSelectData: (dynamic result) {
            final data = result as BaseEnumModel;
            _orderTypeController.text = data.getName;
            orderTypeSelected = data;
            _draftingInvoiceBloc.add(
              UpdateOrderSubDetailEvent(
                data: orderSubDetail.updateOrderType(orderType: data),
              ),
            );
          },
          initItems: state,
          validator: (value) {
            if (orderTypeSelected == null) {
              return 'Vui lòng chọn loại đơn';
            }
            return null;
          },
          itemSearchBuilder: (context, index, data) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 8.sp,
              ),
              child: Text.rich(
                TextSpan(
                  text: data.getName,
                  style: AppFont.t.s(),
                ),
              ),
            );
          },
          futureRequest: (value) async {
            return await _mainBloc.searchOrderType(value);
          },
        );
      },
    );
  }

  Widget _orderStatus() {
    return BlocSelector<GlobalCoreBloc, GlobalCoreState, List<BaseEnumModel>>(
      bloc: _mainBloc,
      selector: (state) => state.orderStatus,
      builder: (context, state) {
        return XTextField<BaseEnumModel>(
          controller: _orderStatusController,
          labelText: 'Trạng thái đơn',
          isRequired: true,
          hintText: 'Chọn trạng thái',
          onChanged: (String? value) {
            orderStatusSelected = null;
            if (orderStatusSelected != null) {
              orderStatusSelected = null;
              _draftingInvoiceBloc.add(
                UpdateOrderSubDetailEvent(
                  data: orderSubDetail.updateOrderStatus(orderStatus: null),
                ),
              );
            }
          },
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onSelectData: (dynamic result) {
            final data = result as BaseEnumModel;
            _orderStatusController.text = data.getName;
            orderStatusSelected = data;
            _draftingInvoiceBloc.add(
              UpdateOrderSubDetailEvent(
                data: orderSubDetail.updateOrderStatus(orderStatus: data),
              ),
            );
          },
          initItems: state,
          validator: (value) {
            if (orderStatusSelected == null) {
              return 'Vui lòng chọn trạng thái';
            }
            return null;
          },
          itemSearchBuilder: (context, index, data) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 8.sp,
              ),
              child: Text.rich(
                TextSpan(
                  text: data.getName,
                  style: AppFont.t.s(),
                ),
              ),
            );
          },
          futureRequest: (value) async {
            return await _mainBloc.searchOrderStatus(value);
          },
        );
      },
    );
  }
}
