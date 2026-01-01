part of '../drafting_detail_screen.dart';

class CurrentStoreWidget extends StatefulWidget {
  const CurrentStoreWidget({super.key});

  @override
  State<CurrentStoreWidget> createState() => _CurrentStoreWidgetState();
}

class _CurrentStoreWidgetState extends State<CurrentStoreWidget> {
  final TextEditingController _storeNameController = TextEditingController();
  StoreModel? storeSelected;

  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  final StoreBloc _storeBloc = getIt.get<StoreBloc>();

  @override
  void initState() {
    super.initState();
    initData(_draftingInvoiceBloc.state.currentStore);
    if (_storeBloc.state.storesOfUser.isEmpty) {
      _storeBloc.add(GetStoresByUserEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      listener: (context, state) {
        if (state is GetCurrentDraftDataSuccess) {
          initData(state.currentStore);
        }
      },
      buildWhen: (previous, current) =>
          current is GetCurrentDraftDataSuccess || current is IsGettingDetail,
      //UpdateCurrentStoreSuccess
      builder: (context, state) {
        if (state.cartType == CartType.tradeIn) {
          return BoxSpacer.blank;
        }

        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle:
              Icon(Icons.store, size: 18.sp, color: AppColors.neutral3Color),
          title: 'Cửa hàng lên đơn',
          child: Column(
            children: [
              _storeName(),
            ],
          ),
        );
      },
    );
  }

  Widget _storeName() {
    return BlocSelector<StoreBloc, StoreState, List<StoreModel>>(
      bloc: _storeBloc,
      selector: (state) => state.storesOfUser,
      builder: (context, state) {
        return XTextField<StoreModel>(
          controller: _storeNameController,
          isRequired: true,
          hintText: 'Chọn cửa hàng',
          onChanged: (String? value) {
            storeSelected = null;
            if (storeSelected != null) {
              storeSelected = null;
              _draftingInvoiceBloc.add(UpdateCurrentStoreEvent(store: null));
            }
          },
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onSelectData: (dynamic result) {
            final data = result as StoreModel;
            _storeNameController.text = data.getName;
            storeSelected = data;
            _draftingInvoiceBloc.add(UpdateCurrentStoreEvent(store: data));
          },
          initItems: state,
          validator: (value) {
            if (storeSelected == null) {
              return 'Vui lòng chọn cửa hàng';
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
            return await _storeBloc.suggestionsUserCallback(value);
          },
        );
      },
    );
  }

  initData(StoreModel? store) {
    _storeNameController.text = store?.getName ?? '';
    storeSelected = store;
  }
}
