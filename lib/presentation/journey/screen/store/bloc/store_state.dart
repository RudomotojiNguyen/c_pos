part of 'store_bloc.dart';

@immutable
sealed class StoreState extends Equatable {
  final List<StoreModel> stores;
  final List<StoreModel> storesOfUser;
  final List<StoreModel>
      userStoresCanChange; // cửa hàng cửa người dùng có thể chuyển
  final PageInfoEntity pageInfo;

  const StoreState({
    required this.stores,
    required this.storesOfUser,
    required this.userStoresCanChange,
    required this.pageInfo,
  });

  @override
  List<Object?> get props =>
      [stores, userStoresCanChange, pageInfo, storesOfUser];

  int get currentPage => pageInfo.getPage;

  int get limit => pageInfo.getLimit;
}

final class StoreInitial extends StoreState {
  const StoreInitial({
    required super.stores,
    required super.storesOfUser,
    required super.userStoresCanChange,
    required super.pageInfo,
  });
}

final class GetStoreSuccess extends StoreState {
  GetStoreSuccess({
    required StoreState state,
    required super.stores,
  }) : super(
          userStoresCanChange: state.userStoresCanChange,
          pageInfo: state.pageInfo,
          storesOfUser: state.storesOfUser,
        );
}

final class GetUserStoreCanChangeSuccess extends StoreState {
  GetUserStoreCanChangeSuccess({
    required StoreState state,
    required super.userStoresCanChange,
  }) : super(
          stores: state.stores,
          pageInfo: state.pageInfo,
          storesOfUser: state.storesOfUser,
        );
}

final class GetUserStoreCanChangeLoading extends StoreState {
  GetUserStoreCanChangeLoading({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          pageInfo: state.pageInfo,
          storesOfUser: state.storesOfUser,
        );
}

final class ChangeUserStoreSuccess extends StoreState {
  ChangeUserStoreSuccess({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          pageInfo: state.pageInfo,
          storesOfUser: state.storesOfUser,
        );
}

final class GetExchangeHistoryLoading extends StoreState {
  GetExchangeHistoryLoading({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          pageInfo: state.pageInfo,
          storesOfUser: state.storesOfUser,
        );
}

final class GetExchangeHistoryLoadMore extends StoreState {
  GetExchangeHistoryLoadMore({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          pageInfo: state.pageInfo,
          storesOfUser: state.storesOfUser,
        );
}

final class GetExchangeHistorySuccess extends StoreState {
  GetExchangeHistorySuccess({
    required StoreState state,
    // required super.exchangeHistory,
    required super.pageInfo,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          storesOfUser: state.storesOfUser,
        );
}

final class CreateTicketExchangeSuccess extends StoreState {
  CreateTicketExchangeSuccess({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          //    exchangeHistory: state.exchangeHistory,
          pageInfo: state.pageInfo,
          storesOfUser: state.storesOfUser,
        );
}

/// start get stores by user
final class GetStoresByUserSuccess extends StoreState {
  GetStoresByUserSuccess({
    required StoreState state,
    required super.storesOfUser,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          pageInfo: state.pageInfo,
        );
}

final class GetStoresByUserLoading extends StoreState {
  GetStoresByUserLoading({
    required StoreState state,
  }) : super(
          stores: state.stores,
          userStoresCanChange: state.userStoresCanChange,
          pageInfo: state.pageInfo,
          storesOfUser: state.storesOfUser,
        );
}

/// end get stores by user
