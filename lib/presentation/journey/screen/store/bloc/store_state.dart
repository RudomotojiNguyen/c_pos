part of 'store_bloc.dart';

@immutable
sealed class StoreState extends Equatable {
  final List<StoreModel> stores;
  final List<StoreModel>
      userStoresCanChange; // cửa hàng cửa người dùng có thể chuyển
  final List<HistoryChangeStoreModel>
      exchangeHistory; // lịch sử yêu cầu chuyển cửa hàng
  final PageInfoEntity pageInfo;

  const StoreState({
    required this.stores,
    required this.userStoresCanChange,
    required this.exchangeHistory,
    required this.pageInfo,
  });

  @override
  List<Object?> get props =>
      [stores, userStoresCanChange, pageInfo, exchangeHistory];

  int get currentPage => pageInfo.getPage;

  int get limit => pageInfo.getLimit;
}

final class StoreInitial extends StoreState {
  const StoreInitial({
    required super.stores,
    required super.userStoresCanChange,
    required super.exchangeHistory,
    required super.pageInfo,
  });
}

final class GetStoreSuccess extends StoreState {
  GetStoreSuccess({
    required StoreState state,
    required super.stores,
  }) : super(
          userStoresCanChange: state.userStoresCanChange,
          exchangeHistory: state.exchangeHistory,
          pageInfo: state.pageInfo,
        );
}

final class GetUserStoreCanChangeSuccess extends StoreState {
  GetUserStoreCanChangeSuccess({
    required StoreState state,
    required super.userStoresCanChange,
  }) : super(
          stores: state.stores,
          exchangeHistory: state.exchangeHistory,
          pageInfo: state.pageInfo,
        );
}

final class GetUserStoreCanChangeLoading extends StoreState {
  GetUserStoreCanChangeLoading({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          exchangeHistory: state.exchangeHistory,
          pageInfo: state.pageInfo,
        );
}

final class ChangeUserStoreSuccess extends StoreState {
  ChangeUserStoreSuccess({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          exchangeHistory: state.exchangeHistory,
          pageInfo: state.pageInfo,
        );
}

final class GetExchangeHistoryLoading extends StoreState {
  GetExchangeHistoryLoading({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          exchangeHistory: state.exchangeHistory,
          pageInfo: state.pageInfo,
        );
}

final class GetExchangeHistoryLoadMore extends StoreState {
  GetExchangeHistoryLoadMore({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          exchangeHistory: state.exchangeHistory,
          pageInfo: state.pageInfo,
        );
}

final class GetExchangeHistorySuccess extends StoreState {
  GetExchangeHistorySuccess({
    required StoreState state,
    required super.exchangeHistory,
    required super.pageInfo,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
        );
}

final class CreateTicketExchangeSuccess extends StoreState {
  CreateTicketExchangeSuccess({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          exchangeHistory: state.exchangeHistory,
          pageInfo: state.pageInfo,
        );
}
