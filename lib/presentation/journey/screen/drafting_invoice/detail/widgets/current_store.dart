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
        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle: Assets.svg.bill.svg(
            width: 26.sp,
            height: 26.sp,
          ),
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
      selector: (state) => state.stores,
      builder: (context, state) {
        return XTextField<StoreModel>(
          controller: _storeNameController,
          labelText: 'Cửa hàng lên đơn',
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
            return await _storeBloc.suggestionsCallback(value);
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
