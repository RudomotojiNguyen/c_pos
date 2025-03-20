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

  @override
  void initState() {
    super.initState();
    _employeeBloc.add(GetEmployeesEvent());
  }

  // thông nhân viên luôn hiển thị đầu tiên
  // widget render lại khi state hiện tại là:
  //    - lấy thông tin đơn
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetDraftingInvoiceDetailSuccess ||
          current is GetDraftingInvoiceDetailLoading,
      builder: (context, state) {
        if (state.checkNullDraft ||
            [CartType.tradeIn, CartType.warranty].contains(state.cartType)) {
          return BoxSpacer.blank;
        }
        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle: Assets.svg.customer.svg(
            width: 22.sp,
            height: 22.sp,
          ),
          title: 'NV Hỗ trợ',
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              runSpacing: 8.sp,
              spacing: 8.sp,
              children: [
                BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
                    EmployeeModel?>(
                  bloc: _draftingInvoiceBloc,
                  selector: (state) => state.saleInfo,
                  builder: (context, state) {
                    return _renderSaleInfo(state);
                  },
                ),
                BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
                    EmployeeModel?>(
                  bloc: _draftingInvoiceBloc,
                  selector: (state) => state.technicalInfo,
                  builder: (context, state) {
                    return _renderTechnicalInfo(state);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _renderSaleInfo(EmployeeModel? sale) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      bloc: _employeeBloc,
      builder: (context, state) {
        return _renderEmployeeInfo(
          title: 'BH:',
          employeeColor: AppColors.informationColor,
          onPressed: () {
            showWidgetDialog(
              context,
              barrierDismissible: true,
              title: 'Danh sách nhân viên',
              content: SearchEmployeeDialog(
                employees: state.employees,
                callback: (result) {
                  _draftingInvoiceBloc
                      .add(UpdateSaleInfoOfBillEvent(employee: result));
                },
              ),
            );
          },
          value: sale?.fullName ?? 'Chưa có',
        );
      },
    );
  }

  Widget _renderTechnicalInfo(EmployeeModel? tech) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      bloc: _employeeBloc,
      builder: (context, state) {
        return _renderEmployeeInfo(
          title: 'KT:',
          employeeColor: AppColors.primaryColor,
          onPressed: () {
            showWidgetDialog(
              context,
              barrierDismissible: true,
              title: 'Danh sách nhân viên',
              content: SearchEmployeeDialog(
                employees: state.employees,
                callback: (result) {
                  _draftingInvoiceBloc
                      .add(UpdateTechInfoOfBillEvent(employee: result));
                },
              ),
            );
          },
          value: tech?.fullName ?? 'Chưa có',
        );
      },
    );
  }

  Widget _renderEmployeeInfo({
    required String title,
    required String value,
    Function()? onPressed,
    required Color employeeColor,
  }) {
    Color colorStatus =
        value.isEmpty ? AppColors.disabledActionColor : employeeColor;

    return XBaseButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 4.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            width: 1.sp,
            color: colorStatus,
          ),
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppFont.t.s().w700.copyWith(color: colorStatus),
            ),
            BoxSpacer.s8,
            if (value.isEmpty) ...[
              Text(
                'Trống NV',
                style: AppFont.t.s().w700.copyWith(color: colorStatus),
              ),
            ] else ...[
              Text(
                value,
                style: AppFont.t.s().w700.copyWith(color: employeeColor),
              ),
            ],
            BoxSpacer.s8,
            Icon(
              Icons.edit_note,
              color: colorStatus,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}
