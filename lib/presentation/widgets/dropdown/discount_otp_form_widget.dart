import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/configs/configurations.dart';
import '../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../journey/screen/customer/bloc/customer_bloc.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class DiscountOtpFormWidget extends StatefulWidget {
  const DiscountOtpFormWidget({
    super.key,
    this.length = 6,
    required this.onCompleted,
    this.type = DiscountMemberType.none,
    required this.customerPhone,
    this.customerId,
    this.maxPoint = 0,
  });

  final int length;
  final Function(
    int point,
    double amount,
    String otpCode,
    CustomerModel? newCustomerInfo,
  ) onCompleted;
  final DiscountMemberType type;
  final String customerPhone;
  final int? customerId;
  final int maxPoint;

  @override
  State<DiscountOtpFormWidget> createState() => _DiscountOtpFormWidgetState();
}

class _DiscountOtpFormWidgetState extends State<DiscountOtpFormWidget> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  final CustomerBloc _customerBloc = getIt.get<CustomerBloc>();
  final Configurations _configurations = getIt.get<Configurations>();

  final TextEditingController _pointController = TextEditingController();

  final ValueNotifier<int> _countDownController = ValueNotifier(0);
  final ValueNotifier<bool> _enableInputOtpController = ValueNotifier(false);
  final ValueNotifier<bool> _enableButtonController = ValueNotifier(false);
  Timer? _timer;

  // đây là thông tin khách hàng được trả về khi gọi tới api "customerOTP/generate-otp"
  // trường này tránh để customerId được truyền vào bị rỗng
  CustomerModel? customerInfoOtp;

  String get getOtp => _controllers.map((c) => c.text).join();

  int get getPointUse =>
      (_pointController.text.isEmpty ? '0' : _pointController.text)
          .convertToNum
          .toInt();

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _countDownController.dispose();
    _enableButtonController.dispose();
    _enableInputOtpController.dispose();
    _pointController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerBloc, CustomerState>(
      bloc: _customerBloc,
      listener: (context, state) {
        if (state is GetOTPSuccess) {
          customerInfoOtp = state.customerInfo;
          _countDownController.value = AppConstants.defaultTimeCountDown;
          _startCountdown();
          if (!_configurations.isProduct) {
            pasteOtp(state.otp);
          }
        }
        if (state is CheckOTPSuccess) {
          widget.onCompleted(
            state.point,
            state.amount,
            getOtp,
            customerInfoOtp,
          );
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.type == DiscountMemberType.point) ...[
              Text('Tiêu điểm', style: AppFont.t.s()),
              BoxSpacer.s8,
            ],
            _formInput(),
            BoxSpacer.s8,
            ValueListenableBuilder(
              valueListenable: _countDownController,
              builder: (context, value, child) {
                if (value == 0) {
                  return _resend();
                }
                return _countdown(value);
              },
            ),
            BoxSpacer.s16,
            _bottomSubmit(),
          ],
        ),
      ),
    );
  }

  ///
  /// WIDGET
  ///
  Widget _bottomSubmit() {
    return ValueListenableBuilder(
      valueListenable: _enableButtonController,
      builder: (context, value, _) {
        return XButton(disable: !value, onPressed: onSubmit, title: 'Xác nhận');
      },
    );
  }

  Widget _formInput() {
    return Column(
      children: [
        // point
        _inputPoint(),
        //otp
        _inputOTP(),
      ],
    );
  }

  Widget _countdown(int data) {
    return Text.rich(
      TextSpan(
        text: 'Gửi lại mã trong ',
        children: [TextSpan(text: data.formatCountdownTimer())],
      ),
    );
  }

  Widget _inputOTP() {
    return ValueListenableBuilder(
      valueListenable: _enableInputOtpController,
      builder: (context, value, child) {
        if (value) {
          return child ?? Container();
        }
        return BoxSpacer.blank;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.length, (index) {
          return SizedBox(
            width: 40.sp,
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              maxLength: 1,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                PasteTextInputFormatter(
                  onPaste: () async {
                    final clipboardData = await Clipboard.getData('text/plain');
                    if (clipboardData != null && clipboardData.text != null) {
                      _checkPaste(clipboardData.text!);
                      return;
                    }
                  },
                ),
              ],
              onChanged: (value) => _onChanged(value, index),
              style: AppFont.t.s(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(AppRadius.xxm),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(AppRadius.xxm),
                  borderSide: const BorderSide(color: AppColors.dividerColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(AppRadius.xxm),
                  borderSide: const BorderSide(color: AppColors.dividerColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(AppRadius.xxm),
                  borderSide: BorderSide(
                    color: Colors.red.withValues(alpha: .5),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(AppRadius.xxm),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                counterText: '',
                alignLabelWithHint: true,
                filled: true,
                errorMaxLines: 3,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _inputPoint() {
    if (widget.type == DiscountMemberType.point) {
      bool isValidInput = false;
      return Column(
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return XTextField(
                controller: _pointController,
                hintText: 'Nhập số điểm bạn muốn sử dụng',
                textInputType: TextInputType.number,
                onChanged: (value) {
                  if (_enableInputOtpController.value) {
                    _enableInputOtpController.value = false;
                  }
                  if ((value).convertToNum <= widget.maxPoint) {
                    if (!isValidInput) {
                      setState(() {
                        isValidInput = true;
                      });
                    }
                  } else {
                    if (isValidInput) {
                      setState(() {
                        isValidInput = false;
                      });
                    }
                  }
                },
                suffixWidget: XBaseButton(
                  disable: !isValidInput,
                  onPressed: () {
                    _enableInputOtpController.value = true;
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                      color: isValidInput
                          ? AppColors.primaryColor
                          : AppColors.disabledActionColor,
                      borderRadius: BorderRadius.all(AppRadius.xxm),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              );
            },
          ),
          BoxSpacer.s16,
        ],
      );
    }
    return BoxSpacer.blank;
  }

  Widget _resend() {
    return ValueListenableBuilder(
      valueListenable: _enableInputOtpController,
      child: Text.rich(
        TextSpan(
          text:
              'Nhập mã OTP đã có trong App Loyalty hoặc mã đã gửi tới số điện thoại của khách ',
          style: AppFont.t.s(),
          children: [
            if (!_configurations.isProduct) ...[
              TextSpan(
                text: '(Gửi OTP)',
                style: AppFont.t.s().information,
                recognizer: TapGestureRecognizer()..onTap = onResendOTP,
              ),
            ],
          ],
        ),
      ),
      builder: (context, value, child) {
        if (value) {
          return child!;
        }
        return BoxSpacer.blank;
      },
    );
  }

  ///
  /// METHOD
  ///

  void onSubmit() {
    if (customerInfoOtp?.id != null || widget.customerId != null) {
      _customerBloc.add(
        CheckOTPEvent(
          type: widget.type,
          customerId: widget.customerId ?? customerInfoOtp!.id!,
          otpCode: getOtp,
          pointUse: getPointUse,
        ),
      );
    }
  }

  void onResendOTP() {
    _customerBloc.add(
      GetOTPEvent(
        type: widget.type,
        customerId: widget.customerId ?? customerInfoOtp?.id,
        customerPhone: widget.customerPhone,
        point: getPointUse,
      ),
    );
  }

  void pasteOtp(String value) {
    for (var i = 0; i < widget.length; i++) {
      _controllers[i].text = i < value.length ? value[i] : "";
    }
    _focusNodes.last.requestFocus();
    _enableButtonController.value = true;
  }

  void _checkPaste(String clipboardData) {
    if (clipboardData.length == widget.length) {
      pasteOtp(clipboardData);
    }
  }

  void _onChanged(String value, int index) async {
    if (widget.length == getOtp.length) {
      _enableButtonController.value = true;
      _focusNodes[index].unfocus();
      return;
    } else {
      _enableButtonController.value = false;
    }

    if (value.isNotEmpty) {
      if (index + 1 < widget.length) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countDownController.value > 0) {
        _countDownController.value -= 1;
      } else {
        timer.cancel();
      }
    });
  }
}
