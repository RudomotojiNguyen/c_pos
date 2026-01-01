part of '../drafting_detail_screen.dart';

class EmployeeOfBillWidget extends StatefulWidget {
  const EmployeeOfBillWidget({super.key});

  @override
  State<EmployeeOfBillWidget> createState() => _EmployeeOfBillWidgetState();
}

class _EmployeeOfBillWidgetState extends State<EmployeeOfBillWidget>
    with DialogHelper {
  final EmployeeBloc _employeeBloc = getIt.get<EmployeeBloc>();
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  // thông nhân viên luôn hiển thị đầu tiên
  // widget render lại khi state hiện tại là:
  //    - lấy thông tin đơn
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) => {
        GetCurrentDraftDataSuccess,
        IsGettingDetail,
        GetCurrentDraftDataError,
        UpdateEmployeeSubDetailSuccess
      }.contains(current.runtimeType),
      listener: (context, state) {
        if (state is UpdateCurrentStoreSuccess ||
            state is GetCurrentDraftDataSuccess) {
          if (state.currentStore?.id != null) {
            _employeeBloc.add(GetEmployeesByStoreEvent(
                storeIds: [state.currentStore?.id ?? 0]));
          }
        }
      },
      builder: (context, state) {
        if (state.checkNullDraft ||
            {CartType.tradeIn, CartType.updateOrder, CartType.order}
                .contains(state.cartType)) {
          return BoxSpacer.blank;
        }
        EmployeeSubDetailModel employeeSubDetail = state.employeeSubDetail;

        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle:
              Icon(Icons.person, size: 18.sp, color: AppColors.neutral3Color),
          containerType: ContainerType.expand,
          initiallyExpanded: false,
          title: 'Thông tin nhân viên',
          child: BlocBuilder<EmployeeBloc, EmployeeState>(
            bloc: _employeeBloc,
            buildWhen: (previous, current) => {
              UpdateEmployeesData,
              GetEmployeesByStoreSuccess
            }.contains(current.runtimeType),
            builder: (context, state) {
              List<EmployeeModel> employees = state.employees;
              if (employees.isEmpty) {
                return const EmptyDataWidget(
                  emptyMessage: 'Không có nhân viên trong cửa hàng',
                );
              }

              return SizedBox(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  runSpacing: 8.sp,
                  spacing: 8.sp,
                  children: [
                    BoxSpacer.s8,
                    _renderEmployeeInfo(
                      employee: employeeSubDetail.employee,
                      title: 'Nhân viên bán hàng',
                      onPressed: () async {
                        _onSelectSaler(employees);
                      },
                    ),
                    const XDivider(),
                    _renderEmployeeInfo(
                      employee: employeeSubDetail.technical,
                      title: 'Nhân viên kỹ thuật',
                      onPressed: () async {
                        _onSelectTechincal(employees);
                      },
                    ),
                    const XDivider(),
                    _renderEmployeeInfo(
                      employee: employeeSubDetail.cdpk,
                      title: 'Nhân viên CDPK',
                      onPressed: () async {
                        _onSelectCdpk(employees);
                      },
                    ),
                    const XDivider(),
                    _renderEmployeeInfo(
                      employee: employeeSubDetail.cashier,
                      title: 'Nhân viên thu ngân',
                      onPressed: () async {
                        _onSelectCashier(employees);
                      },
                    ),
                    const XDivider(),
                    _renderEmployeeInfo(
                      employee: employeeSubDetail.manager,
                      title: 'Nhân viên quản lý',
                      onPressed: () async {
                        _onSelectManager(employees);
                      },
                    ),
                    const XDivider(),
                    _renderEmployeeInfo(
                      employee: employeeSubDetail.assistant,
                      title: 'Nhân viên trợ lý',
                      onPressed: () async {
                        _onSelectAssistant(employees);
                      },
                    ),
                    const XDivider(),
                    _renderEmployeeInfo(
                      employee: employeeSubDetail.receptionist,
                      title: 'Nhân viên tiếp đón',
                      onPressed: () async {
                        _onSelectReceptionist(employees);
                      },
                    ),
                    const XDivider(),
                    _renderEmployeeInfo(
                      employee: employeeSubDetail.delivery,
                      title: 'Nhân viên giao hàng',
                      onPressed: () async {
                        _onSelectDelivery(employees);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  ///
  /// WIDGET
  ///
  Widget _renderEmployeeInfo(
      {EmployeeModel? employee, String? title, Function()? onPressed}) {
    return XBaseButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: AppFont.t.s(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (employee != null) ...[
                Text(
                  employee.fullName ?? '',
                  style: AppFont.t.s(),
                ),
              ] else ...{
                Text(
                  'Chưa chọn',
                  style: AppFont.t.s().neutral3,
                ),
              },
              BoxSpacer.s4,
              Icon(
                Icons.arrow_forward_ios,
                size: 8.sp,
                color: AppColors.neutral3Color,
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///
  /// METHOD
  ///

  void _onSelectSaler(List<EmployeeModel> employees) async {
    final res = await showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      body: SearchEmployeeDialog(
        employees: employees,
      ),
    );

    if (res != null) {
      _draftingInvoiceBloc.add(UpdateSalerOfBillEvent(employee: res));
    }
  }

  void _onSelectTechincal(List<EmployeeModel> employees) async {
    final res = await showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      body: SearchEmployeeDialog(
        employees: employees,
      ),
    );

    if (res != null) {
      _draftingInvoiceBloc.add(UpdateTechnicalOfBillEvent(employee: res));
    }
  }

  void _onSelectCdpk(List<EmployeeModel> employees) async {
    final res = await showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      body: SearchEmployeeDialog(
        employees: employees,
      ),
    );

    if (res != null) {
      _draftingInvoiceBloc.add(UpdateCdpkOfBillEvent(employee: res));
    }
  }

  void _onSelectCashier(List<EmployeeModel> employees) async {
    final res = await showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      body: SearchEmployeeDialog(
        employees: employees,
      ),
    );

    if (res != null) {
      _draftingInvoiceBloc.add(UpdateCashierOfBillEvent(employee: res));
    }
  }

  void _onSelectManager(List<EmployeeModel> employees) async {
    final res = await showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      body: SearchEmployeeDialog(
        employees: employees,
      ),
    );

    if (res != null) {
      _draftingInvoiceBloc.add(UpdateManagerOfBillEvent(employee: res));
    }
  }

  void _onSelectAssistant(List<EmployeeModel> employees) async {
    final res = await showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      body: SearchEmployeeDialog(
        employees: employees,
      ),
    );

    if (res != null) {
      _draftingInvoiceBloc.add(UpdateAssistantOfBillEvent(employee: res));
    }
  }

  void _onSelectReceptionist(List<EmployeeModel> employees) async {
    final res = await showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      body: SearchEmployeeDialog(
        employees: employees,
      ),
    );

    if (res != null) {
      _draftingInvoiceBloc.add(UpdateReceptionistOfBillEvent(employee: res));
    }
  }

  void _onSelectDelivery(List<EmployeeModel> employees) async {
    final res = await showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      body: SearchEmployeeDialog(
        employees: employees,
      ),
    );

    if (res != null) {
      _draftingInvoiceBloc.add(UpdateDeliveryOfBillEvent(employee: res));
    }
  }
}
