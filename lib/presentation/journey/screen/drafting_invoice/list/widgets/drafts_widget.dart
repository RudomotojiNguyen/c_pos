part of '../drafts_screen.dart';

class DraftsWidget extends StatefulWidget {
  const DraftsWidget({super.key});

  @override
  State<DraftsWidget> createState() => _DraftsWidgetState();
}

class _DraftsWidgetState extends State<DraftsWidget> {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.isSmallScreen ? 1 : 2;
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      builder: (context, state) {
        if (state is GetDraftingInvoiceLoading) {
          return const XLoading();
        }

        if (state.draftingInvoiceList.isEmpty ||
            state is GetDraftingInvoiceError) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Chưa có đơn bán',
              ),
            ],
          );
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: const RefreshWidget(),
          onRefresh: () async {
            _draftingInvoiceBloc.add(GetDraftingInvoiceListEvent());
            _refreshController.refreshCompleted();
          },
          child: SingleChildScrollView(
            child: XGridView(
              type: XGridViewType.aligned,
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16.sp,
              crossAxisSpacing: 16.sp,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
              itemCount: state.draftingInvoiceList.length,
              itemBuilder: (context, index) {
                return DraftItem(
                  cartDetail: state.draftingInvoiceList[index],
                  index: index,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
