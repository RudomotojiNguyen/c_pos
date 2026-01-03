import 'package:c_pos/common/di/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/enum/enum.dart';
import '../../../../../common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../widgets/widgets.dart';
import '../../address/bloc/address_bloc.dart';
import '../bloc/customer_bloc.dart';

/// todo: thêm danh xưng và loại khách hàng

class CustomerDetailScreen extends StatefulWidget {
  const CustomerDetailScreen({super.key, required this.customerId});

  final int customerId;

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends XStateWidget<CustomerDetailScreen> {
  final CustomerBloc _customerBloc = getIt.get<CustomerBloc>();
  final AddressBloc _addressBloc = getIt.get<AddressBloc>();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final ValueNotifier<List<DateTime?>?> dateOfBirth = ValueNotifier(null);
  CityModel? city;
  final TextEditingController _cityController = TextEditingController();
  DistrictModel? district;
  final TextEditingController _districtController = TextEditingController();
  WardModel? ward;
  final TextEditingController _wardController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  SingleSelectController<XGenderType?> selectedItemNotifier =
      SingleSelectController(null);

  final _kForm = GlobalKey<FormState>();
  CustomerModel? currentCustomer;

  @override
  void initState() {
    super.initState();
    _addressBloc.add(GetCitiesEvent());
    _customerBloc.add(GetCustomerByIdEvent(widget.customerId));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    dateOfBirth.dispose();
    selectedItemNotifier.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _wardController.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Cập nhật khách hàng',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocConsumer<CustomerBloc, CustomerState>(
      bloc: _customerBloc,
      listener: _onListeningCustomerInfo,
      buildWhen: (previous, current) =>
          current is GetCustomerDetailSuccess || current is UpdateIsLoading,
      builder: (context, state) {
        if (state is UpdateIsLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20.sp, height: 20.sp, child: const XLoading()),
              ],
            ),
          );
        }

        if (state is GetCustomerDetailSuccess) {
          return _customerDetailWidget();
        }

        return const EmptyDataWidget(
          emptyMessage: 'Không tìm thấy dữ liệu khách hàng',
        );
      },
    );
  }

  ///
  /// WIDGET
  ///

  Widget _customerDetailWidget() {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      header: const RefreshWidget(),
      onRefresh: () async {
        _refreshController.refreshCompleted();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          child: Form(
            key: _kForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                _customerNameWidget(),
                BoxSpacer.s16,
                _customerLastNameWidget(),
                BoxSpacer.s16,
                _customerPhoneWidget(),
                BoxSpacer.s16,
                _customerBirthdayWidget(),
                BoxSpacer.s16,
                _customerGenderWidget(),
                BoxSpacer.s16,
                _customerEmailWidget(),
                BoxSpacer.s16,
                _customerAddressWidget(),
                BoxSpacer.size(64),
                _saveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customerNameWidget() {
    return XTextField(
      controller: _nameController,
      isRequired: true,
      labelText: 'Tên khách hàng',
    );
  }

  Widget _customerLastNameWidget() {
    return XTextField(
      controller: _lastNameController,
      isRequired: false,
      labelText: 'Họ',
    );
  }

  Widget _customerPhoneWidget() {
    return XTextField(
      controller: _phoneController,
      isRequired: true,
      isEditMode: false,
      labelText: 'Số điện thoại',
    );
  }

  Widget _customerBirthdayWidget() {
    return ValueListenableBuilder(
        valueListenable: dateOfBirth,
        builder: (context, value, _) {
          return XTextField(
            labelText: 'Ngày sinh',
            hintText: 'Chọn ngày sinh',
            textInputStyle: TextInputStyle.selectSingleDate,
            dates: value,
            onResultDateSelect: (List<DateTime?>? dates) {
              if ((dates ?? []).isNotEmpty) {
                dateOfBirth.value = dates;
              }
            },
          );
        });
  }

  Widget _customerGenderWidget() {
    return XBasicDropDown<XGenderType>(
      labelText: 'Giới tính',
      isRequired: true,
      hintText: 'Giới tính',
      expandedHeaderPadding: EdgeInsets.zero,
      items: const [XGenderType.female, XGenderType.male, XGenderType.none],
      selectedItemNotifier: selectedItemNotifier,
      listItemBuilder: (BuildContext context, XGenderType result,
          bool isSelected, VoidCallback onItemSelect) {
        return Text(
          result.getTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFont.t.s(12).neutral2,
        );
      },
      headerBuilder:
          (BuildContext context, XGenderType result, bool isSelected) {
        return Text(
          result.getTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFont.t.s(12).neutral2,
        );
      },
      onChanged: (value) {
        //
      },
      validator: (value) {
        if (value != null) {
          return null;
        }
        return 'Chọn giới tính';
      },
    );
  }

  Widget _customerEmailWidget() {
    return XTextField(
      controller: _emailController,
      labelText: 'Email',
    );
  }

  Widget _customerAddressWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Địa chỉ',
          style: AppFont.t.s(12).neutral2,
        ),
        BoxSpacer.s16,
        _cityWidget(),
        _districtWidget(),
        _wardWidget(),
        BoxSpacer.s16,
        XTextField(
          controller: _addressController,
          hintText: 'Số nhà, tên đường cụ thể',
        ),
      ],
    );
  }

  Widget _cityWidget() {
    return BlocBuilder<AddressBloc, AddressState>(
      bloc: _addressBloc,
      buildWhen: (previous, current) => current is GetCitiesSuccess,
      builder: (context, state) {
        return XTextField<CityModel>(
          controller: _cityController,
          hintText: 'Chọn Tỉnh/Thành phố',
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (p0) {
            district = null;
            ward = null;
            _districtController.text = '';
            _wardController.text = '';
          },
          onSelectData: (dynamic value) {
            city = value as CityModel;
            _cityController.text = value.getName;
            district = null;
            ward = null;
            _districtController.text = '';
            _wardController.text = '';
            _addressBloc.add(GetDistrictsEvent(cityId: city!.id!));
          },
          initItems: state.cities,
          itemSearchBuilder: (context, index, data) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 8.sp,
              ),
              child: Text.rich(
                TextSpan(
                  text: data.getName,
                  style: AppFont.t.s(12).neutral2,
                ),
              ),
            );
          },
          futureRequest: (value) async {
            final currentValue = (value).toStrSearch;
            final result = state.cities
                .where(
                  (element) =>
                      element.getName.toStrSearch.contains(currentValue),
                )
                .toList();
            return result.isEmpty ? state.cities : result;
          },
        );
      },
    );
  }

  Widget _districtWidget() {
    return BlocBuilder<AddressBloc, AddressState>(
      bloc: _addressBloc,
      buildWhen: (previous, current) => current is GetDistrictsSuccess,
      builder: (context, state) {
        if (state.districts.isEmpty) {
          return BoxSpacer.blank;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BoxSpacer.s16,
            XTextField<DistrictModel>(
              controller: _districtController,
              hintText: 'Chọn Quận/Huyện',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (p0) {
                ward = null;
                _wardController.text = '';
              },
              onSelectData: (dynamic value) {
                district = value as DistrictModel;
                _districtController.text = value.getName;
                ward = null;
                _wardController.text = '';
                _addressBloc.add(GetWardsEvent(districtId: district!.id!));
              },
              initItems: state.districts,
              itemSearchBuilder: (context, index, data) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.sp,
                    vertical: 8.sp,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: data.getName,
                      style: AppFont.t.s(12).neutral2,
                    ),
                  ),
                );
              },
              futureRequest: (value) async {
                final currentValue = (value).toStrSearch;
                final result = state.districts
                    .where(
                      (element) =>
                          element.getName.toStrSearch.contains(currentValue),
                    )
                    .toList();
                return result.isEmpty ? state.districts : result;
              },
            ),
          ],
        );
      },
    );
  }

  Widget _wardWidget() {
    return BlocBuilder<AddressBloc, AddressState>(
      bloc: _addressBloc,
      buildWhen: (previous, current) => current is GetWardsSuccess,
      builder: (context, state) {
        if (state.wards.isEmpty) {
          return BoxSpacer.blank;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BoxSpacer.s16,
            XTextField<WardModel>(
              controller: _wardController,
              hintText: 'Chọn Phường/Xã',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (p0) {
                district = null;
                ward = null;
              },
              onSelectData: (dynamic value) {
                ward = value as WardModel;
                _wardController.text = value.getName;
              },
              initItems: state.wards,
              itemSearchBuilder: (context, index, data) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.sp,
                    vertical: 8.sp,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: data.getName,
                      style: AppFont.t.s(12).neutral2,
                    ),
                  ),
                );
              },
              futureRequest: (value) async {
                final currentValue = (value).toStrSearch;
                final result = state.wards
                    .where(
                      (element) =>
                          element.getName.toStrSearch.contains(currentValue),
                    )
                    .toList();
                return result.isEmpty ? state.wards : result;
              },
            ),
          ],
        );
      },
    );
  }

  Widget _saveButton() {
    return XButton(
      onPressed: _onPressSave,
      title: 'Lưu',
    );
  }
}

extension _CustomerDetailScreenExtension on _CustomerDetailScreenState {
  ///
  /// METHOS
  ///
  void _onListeningCustomerInfo(BuildContext context, CustomerState state) {
    if (state is GetCustomerDetailSuccess) {
      currentCustomer = state.customer;

      _nameController.text = state.customer.fullName ?? '';
      _lastNameController.text = state.customer.lastName ?? '';
      _phoneController.text = state.customer.phoneNo ?? '';
      _emailController.text = state.customer.email ?? '';
      _addressController.text = state.customer.address ?? '';
      dateOfBirth.value = [state.customer.getCustomerBirthDay];
      selectedItemNotifier.value = state.customer.getGender;

      if (state.customer.city != null) {
        _addressBloc.getCityById(state.customer.city!).then((value) {
          city = value;
          _cityController.text = value?.getName ?? '';
        });
      }

      if (state.customer.district != null) {
        _addressBloc.add(GetDistrictsEvent(cityId: state.customer.city!));
        _addressBloc
            .getDistrictById(
          districtId: state.customer.district!,
          cityId: state.customer.city!,
        )
            .then((value) {
          district = value;
          _districtController.text = value?.getName ?? '';
        });
      }

      if (state.customer.ward != null) {
        _addressBloc.add(GetWardsEvent(districtId: state.customer.district!));
        _addressBloc
            .getWardById(
          wardId: state.customer.ward!,
          districtId: state.customer.district!,
        )
            .then((value) {
          ward = value;
          _wardController.text = value?.getName ?? '';
        });
      }
    }
  }

  void _onPressSave() {
    if (_kForm.currentState!.validate()) {
      currentCustomer?.copyWith(
        id: widget.customerId,
        fullName: _nameController.text,
        lastName: _lastNameController.text,
        phoneNo: _phoneController.text,
        email: _emailController.text,
        city: city?.id,
        district: district?.id,
        ward: ward?.id,
        address: _addressController.text,
        gender: selectedItemNotifier.value,
        appellation: selectedItemNotifier.value,
        dateOfBirth: dateOfBirth.value?.first
            ?.formatDateTime(format: XDateTimeEnum.yearMonthDay),
      );

      _customerBloc.add(UpdateCustomerEvent(currentCustomer!));
    } else {
      XToast.showWarningMessage(
          message: 'Hãy nhập đầy đủ thông tin khách hàng');
    }
  }
}
