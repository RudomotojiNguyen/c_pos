import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/di/injection/injection.dart';
import '../../../common/extensions/extension.dart';
import '../../../data/models/stock_model.dart';
import '../../../gen/assets.gen.dart' as core_assets;
import '../../journey/screen/stock/bloc/stock_bloc.dart';
import '../widgets.dart';

class StockDialog extends StatefulWidget {
  const StockDialog({super.key, required this.productId});

  final String productId;

  @override
  State<StockDialog> createState() => _StockDialogState();
}

class _StockDialogState extends State<StockDialog> {
  final StockBloc _stockBloc = getIt.get<StockBloc>();

  @override
  void initState() {
    super.initState();
    _stockBloc.add(GetStockOfProductEvent(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderDialog(title: 'Danh sách chi nhánh'),
        BoxSpacer.s16,
        Expanded(child: _body()),
      ],
    );
  }

  Widget _body() {
    return BlocBuilder<StockBloc, StockState>(
      bloc: _stockBloc,
      builder: (context, state) {
        if (state is StockIsLoading) {
          return ListView.separated(
            itemBuilder: (context, index) => _loadingWidget(),
            separatorBuilder: (context, index) => BoxSpacer.s16,
            itemCount: 10,
          );
        }

        List<StockModel> stores = state.productStocks;

        if (stores.isEmpty) {
          return BoxSpacer.blank;
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            final StockModel store = stores[index];
            return _storeItem(
              address: store.getStoreAddress,
              name: store.getStoreName,
              quantityInStock: store.getInStockQuantity,
              phone: null,
            );
          },
          separatorBuilder: (context, index) => BoxSpacer.s16,
          itemCount: stores.length,
        );
      },
    );
  }

  Widget _loadingWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XPlaceHolder(
          width: 80.sp,
          height: 80.sp,
        ),
        BoxSpacer.s8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            XPlaceHolder(
              width: 200.sp,
              height: 12.sp,
            ),
            BoxSpacer.s8,
            XPlaceHolder(
              width: 80.sp,
              height: 12.sp,
            ),
            BoxSpacer.s8,
            XPlaceHolder(
              width: 120.sp,
              height: 12.sp,
            ),
            BoxSpacer.s8,
            XPlaceHolder(
              width: 240.sp,
              height: 12.sp,
            ),
          ],
        )
      ],
    );
  }

  Widget _storeItem({
    required String name,
    required String address,
    required int quantityInStock,
    String? phone,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // core_assets.Assets.image.pos.ddvstore.image(
        //   width: 80.sp,
        //   height: 80.sp,
        // ),
        // BoxSpacer.s8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppFont.t.s(16.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              BoxSpacer.s4,
              Text(
                address,
                style: AppFont.t.s().neutral3,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              BoxSpacer.s4,
              Text.rich(
                TextSpan(
                  style: AppFont.t.s(),
                  text: 'Còn',
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: quantityInStock.formatNumber,
                      style: AppFont.t.s(14).w800.green,
                    ),
                    const TextSpan(text: ' '),
                    const TextSpan(text: 'tại cửa hàng'),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
