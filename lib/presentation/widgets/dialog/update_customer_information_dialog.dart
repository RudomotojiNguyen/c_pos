import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/constants/app_constants.dart';
import '../../../common/di/injection/injection.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import '../../journey/screen/customer/bloc/customer_bloc.dart';
import '../../theme/themes.dart';
import '../../utils/validation_utils.dart';
import '../widgets.dart';

class UpdateCustomerInformationDialog extends StatefulWidget {
  const UpdateCustomerInformationDialog({
    super.key,
    this.cartType,
    required this.onUpdateCustomer,
    this.initCustomerDetail,
  });

  final Function(CustomerModel? customerInfo) onUpdateCustomer;
  final CustomerModel? initCustomerDetail;
  final CartType? cartType;

  @override
  State<UpdateCustomerInformationDialog> createState() =>
      _UpdateCustomerInformationDialogState();
}

class _UpdateCustomerInformationDialogState
    extends State<UpdateCustomerInformationDialog> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final CustomerBloc _customerBloc = getIt.get<CustomerBloc>();
  SingleSelectController<XGenderType?> selectedItemNotifier =
      SingleSelectController(null);
  final ValueNotifier<List<DateTime?>?> dateOfBirth = ValueNotifier(null);

  final _kForm = GlobalKey<FormState>();

  CustomerModel customerInfo = CustomerModel();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    phoneController.dispose();
    nameController.dispose();
    dateOfBirth.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _kForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocSelector<CustomerBloc, CustomerState, List<CustomerModel>>(
              bloc: _customerBloc,
              selector: (state) => state.customers,
              builder: (context, state) {
                return XTextField<CustomerModel>(
                  labelText: 'Số điện thoại',
                  isRequired: true,
                  hintText: 'Nhập SĐT',
                  controller: phoneController,
                  onChanged: _onChangeText,
                  textInputType: TextInputType.phone,
                  onSelectData: onSelectCustomer,
                  itemSearchBuilder: (context, index, customer) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.sp,
                        vertical: 8.sp,
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: customer.getFullName,
                          style: AppFont.t.s(),
                          children: [
                            const TextSpan(text: ' - '),
                            TextSpan(
                              text: customer.getCustomerPhone,
                              style: AppFont.t.s(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  futureRequest: (value) async {
                    final customers = await getCustomers(value);
                    if (customers.length == 1) {
                      onSelectCustomer(customers[0]);
                      return [];
                    }
                    return customers;
                  },
                  suffixWidget: BlocSelector<CustomerBloc, CustomerState, bool>(
                    bloc: _customerBloc,
                    selector: (state) => state.isLoading,
                    builder: (context, state) {
                      if (state) {
                        return SizedBox(
                            width: 20.sp,
                            height: 20.sp,
                            child: const XLoading());
                      }
                      return Icon(
                        Icons.search,
                        size: 20.sp,
                        color: AppColors.neutralColor,
                      );
                    },
                  ),
                  validator: (value) {
                    if (ValidationUtils.isValidatePhoneNumber(value ?? '')) {
                      return null;
                    }
                    return 'Vui lòng nhập SĐT hợp lệ';
                  },
                );
              },
            ),
            BoxSpacer.s8,
            XTextField(
              labelText: 'Tên khách hàng',
              isRequired: true,
              hintText: 'Nhập tên khách hàng',
              controller: nameController,
              onChanged: (value) {
                customerInfo.copyWith(fullName: value);
              },
              textInputType: TextInputType.text,
              validator: (value) {
                if (value?.isNotNullOrEmpty ?? false) {
                  return null;
                }
                return 'Vui lòng nhập tên khách';
              },
            ),
            BoxSpacer.s8,
            XBasicDropDown<XGenderType>(
              labelText: 'Giới tính',
              hintText: 'Giới tính',
              expandedHeaderPadding: EdgeInsets.zero,
              items: const [
                XGenderType.female,
                XGenderType.male,
                XGenderType.none
              ],
              selectedItemNotifier: selectedItemNotifier,
              listItemBuilder: (BuildContext context, XGenderType result,
                  bool isSelected, VoidCallback onItemSelect) {
                return Text(
                  result.getTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFont.t.s(),
                );
              },
              headerBuilder:
                  (BuildContext context, XGenderType result, bool isSelected) {
                return Text(
                  result.getTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFont.t.s(),
                );
              },
              onChanged: (value) {
                customerInfo.copyWith(
                  gender: value,
                  appellation: value,
                );
              },
            ),
            if ({
              CartType.retail,
              CartType.updateBill,
            }.contains(widget.cartType)) ...[
              BoxSpacer.s8,
              ValueListenableBuilder(
                valueListenable: dateOfBirth,
                builder: (context, value, _) {
                  return XTextField(
                    labelText: 'Ngày sinh',
                    hintText: 'Chọn ngày sinh',
                    textInputStyle: TextInputStyle.selectSingleDate,
                    dates: value,
                    onResultDateSelect: (List<DateTime?>? dates) {
                      if ((dates ?? []).isNotEmpty) {
                        customerInfo.copyWith(
                            dateOfBirth: dates!.first.toString());
                        dateOfBirth.value = dates;
                      }
                    },
                  );
                },
              ),
            ],
            BoxSpacer.s32,
            Row(
              children: [
                Expanded(
                  child: XButton(
                    type: XButtonType.secondary,
                    onPressed: _onSetDefault,
                    title: 'Mặc định',
                  ),
                ),
                BoxSpacer.s16,
                Expanded(
                  child: XButton(
                    onPressed: () {
                      if (_kForm.currentState!.validate()) {
                        widget.onUpdateCustomer(customerInfo);
                        Navigator.pop(context);
                      }
                    },
                    title: 'Xong',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _onSetDefault() {
    customerInfo = AppConstants.defaultCustomer;

    phoneController.text = customerInfo.getCustomerPhone;
    nameController.text = customerInfo.getFullName;
    selectedItemNotifier.value = customerInfo.getGender;

    widget.onUpdateCustomer(customerInfo);
    Navigator.pop(context);
  }

  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }

    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      customerInfo = CustomerModel(phoneNo: value);
      _customerBloc.add(OnchangeTextEvent());
      nameController.text = '';
      selectedItemNotifier.value = null;
      dateOfBirth.value = [];
    });
  }

  onSelectCustomer(dynamic customer) {
    customer = customer as CustomerModel;
    customerInfo = customer;
    phoneController.text = customer.getCustomerPhone;
    nameController.text = customer.getFullName;
    selectedItemNotifier.value = customer.getGender;
    dateOfBirth.value = [customer.getCustomerBirthDay];
  }

  Future<List<CustomerModel>> getCustomers(String value) async {
    try {
      final result = await _customerBloc.getCustomers(
          page: 1, size: 5, phoneNumber: value.trim());
      return result.items;
    } catch (e) {
      return [];
    }
  }

  initData() {
    if (widget.initCustomerDetail != null) {
      customerInfo = widget.initCustomerDetail!;
      phoneController.text = widget.initCustomerDetail!.phoneNo ?? '';
      nameController.text = widget.initCustomerDetail!.fullName ?? '';
      selectedItemNotifier.value = widget.initCustomerDetail!.getGender;
      dateOfBirth.value = [widget.initCustomerDetail!.getCustomerBirthDay];
    }
  }
}
