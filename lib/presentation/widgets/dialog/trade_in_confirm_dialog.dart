import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/di/injection/injection.dart';
import '../../../data/datasources/local_db/local_db.dart';
import '../../journey/screen/drafting_invoice/detail/bloc/drafting_invoice_bloc.dart';
import '../widgets.dart';

class TradeInConfirmDialog extends StatefulWidget {
  const TradeInConfirmDialog({super.key});

  @override
  State<TradeInConfirmDialog> createState() => _TradeInConfirmDialogState();
}

class _TradeInConfirmDialogState extends State<TradeInConfirmDialog> {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final _kForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _amountController.text =
        _draftingInvoiceBloc.state.estimationBuyingPrice.formatNumber;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _kForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderDialog(title: 'Xác nhận thông tin'),
            const XDivider(),
            _productInfo(),
            BoxSpacer.s8,
            _inputFinalPrice(),
            BoxSpacer.s8,
            _noteForBill(),
            BoxSpacer.s8,
            _submitButton(),
          ],
        ),
      ),
    );
  }

  ///
  /// WIDGET
  ///

  Widget _productInfo() {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      builder: (context, state) {
        final ProductTable? product = state.product;
        if (product == null) {
          return BoxSpacer.blank;
        }
        return ProductItemDetailWidget(
          productName: product.getName,
          productImei: product.getImei,
          productImage: product.getImageThumbnail,
          sellingPrice: product.getSellingPrice,
          discountPrice: 0,
          padding: EdgeInsets.all(8.sp),
        );
      },
    );
  }

  Widget _inputFinalPrice() {
    return XTextField(
      isRequired: true,
      controller: _amountController,
      labelText: 'Giá thu cuối cùng',
      hintText: '9,527,....',
      inputFormatters: [NumberFormatter()],
      textInputType: TextInputType.number,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return 'Không thể để trống';
        }
        return null;
      },
    );
  }

  Widget _noteForBill() {
    return XTextField(
      controller: _noteController,
      labelText: 'Ghi chú',
      hintText: 'Những điểm cần lưu ý',
      minLines: 3,
      maxLines: 4,
    );
  }

  Widget _submitButton() {
    return XButton(
      onPressed: _onSubmit,
      title: 'Xác nhận',
    );
  }

  ///
  /// METHOD
  ///

  _onSubmit() {
    if (_kForm.currentState!.validate()) {
      _draftingInvoiceBloc.add(SubmitTradeInBillEvent(
          finalBuyingPrice: _amountController.text.convertToNum,
          note: _noteController.text));
    }
  }
}
