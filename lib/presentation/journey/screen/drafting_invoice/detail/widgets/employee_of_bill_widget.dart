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
        GetCurrentDraftDataError
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
          iconTitle: Assets.svg.person.svg(
            width: 22.sp,
            height: 22.sp,
          ),
          title: 'Thông tin nhân viên',
          child: SizedBox(
            child: Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              runSpacing: 8.sp,
              spacing: 8.sp,
              children: [
                _renderEmployeeInfo(
                  employee: employeeSubDetail.employee,
                  title: 'Nhân viên bán hàng',
                  onPressed: () {},
                ),
                const XDivider(),
                _renderEmployeeInfo(
                  employee: employeeSubDetail.technical,
                  title: 'Nhân viên kỹ thuật',
                  onPressed: () {},
                ),
                const XDivider(),
                _renderEmployeeInfo(
                  employee: employeeSubDetail.cdpk,
                  title: 'Nhân viên CDPK',
                  onPressed: () {},
                ),
                const XDivider(),
                _renderEmployeeInfo(
                  employee: employeeSubDetail.cashier,
                  title: 'Nhân viên thu ngân',
                  onPressed: () {},
                ),
                const XDivider(),
                _renderEmployeeInfo(
                  employee: employeeSubDetail.manager,
                  title: 'Nhân viên quản lý',
                  onPressed: () {},
                ),
                const XDivider(),
                _renderEmployeeInfo(
                  employee: employeeSubDetail.assistant,
                  title: 'Nhân viên trợ lý',
                  onPressed: () {},
                ),
                const XDivider(),
                _renderEmployeeInfo(
                  employee: employeeSubDetail.receptionist,
                  title: 'Nhân viên tiếp đón',
                  onPressed: () {},
                ),
                const XDivider(),
                _renderEmployeeInfo(
                  employee: employeeSubDetail.delivery,
                  title: 'Nhân viên giao hàng',
                  onPressed: () {},
                ),
              ],
            ),
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
                  'Chưa có chọn',
                  style: AppFont.t.s(),
                ),
              },
              Icon(
                Icons.arrow_forward_ios,
                size: 12.sp,
                color: AppColors.iconColor,
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

  ///
}
