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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      listener: (context, state) {
        if (state is GetDraftingInvoiceDetailSuccess) {
          _deliveryCodeController.text = state.orderSubDetail?.shipCode ?? '';
          //
          _orderSourceController.text =
              state.orderSubDetail?.orderSource?.getName ?? '';
          orderSourceSelected = state.orderSubDetail?.orderSource;
          //
          _orderTypeController.text =
              state.orderSubDetail?.orderType?.getName ?? '';
          orderTypeSelected = state.orderSubDetail?.orderType;
          //
          _orderStatusController.text =
              state.orderSubDetail?.orderStatus?.getName ?? '';
          orderStatusSelected = state.orderSubDetail?.orderStatus;
          //
          datesComeToStore.value = [state.orderSubDetail?.dateComeToShop];
          datesPayment.value = [state.orderSubDetail?.datePayFor];
          timeComeToStore.value = state.orderSubDetail?.timeComToShop;
        }
      },
      buildWhen: (previous, current) =>
          current is GetDraftingInvoiceDetailSuccess ||
          current is GetDraftingInvoiceDetailLoading ||
          current is UpdateCustomerSuccess ||
          current is UpdateProductsSuccess,
      builder: (context, state) {
        if ([CartType.order, CartType.updateOrder].contains(state.cartType) &&
            (state.customer != null &&
                state.customer!.getCustomerPhone.isNotEmpty) &&
            (state.products).isNotEmpty) {
          return XContainer(
            margin: EdgeInsets.only(top: 16.sp),
            iconTitle: Assets.svg.bill.svg(
              width: 26.sp,
              height: 26.sp,
            ),
            title: 'Nội dung đơn',
            child: Column(
              children: [
                _dateComeToShop(),
                BoxSpacer.s16,
                _timeComeToShop(),
                BoxSpacer.s16,
                _datePayFor(),
                BoxSpacer.s16,
                _codeDelivery(),
                BoxSpacer.s16,
                _orderSource(),
                BoxSpacer.s16,
                _orderType(),
                BoxSpacer.s16,
                _orderStatus(),
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
                  data: orderSubDetail.copyWith(timeComToShop: time),
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
