part of 'warranty_bloc.dart';

@immutable
sealed class WarrantyState extends Equatable {
  final int page;
  final int limit;
  final bool canLoadMore;
  final List<SuggestNoteModel> warrantiesNote;
  final List<WarrantyModel> warranties;
  final StoreModel? storeSelected;

  const WarrantyState({
    required this.page,
    required this.limit,
    required this.warrantiesNote,
    required this.warranties,
    required this.canLoadMore,
    this.storeSelected,
  });

  @override
  List<Object?> get props =>
      [warrantiesNote, limit, page, canLoadMore, warranties];
}

final class WarrantyInitial extends WarrantyState {
  const WarrantyInitial({
    required super.page,
    required super.limit,
    required super.warrantiesNote,
    required super.warranties,
    required super.canLoadMore,
  });
}

final class GetSuggestNoteSuccess extends WarrantyState {
  GetSuggestNoteSuccess({
    required WarrantyState state,
    required super.warrantiesNote,
    required super.page,
    required super.canLoadMore,
    int? limit,
  }) : super(
          limit: limit ?? state.limit,
          storeSelected: state.storeSelected,
          warranties: state.warranties,
        );
}

final class UpdateIsLoading extends WarrantyState {
  UpdateIsLoading({
    required WarrantyState state,
    int? limit,
  }) : super(
          page: state.page,
          limit: state.limit,
          warrantiesNote: state.warrantiesNote,
          warranties: state.warranties,
          canLoadMore: state.canLoadMore,
          storeSelected: state.storeSelected,
        );
}

final class UpdateFilterSuccess extends WarrantyState {
  final StoreModel? newStore;

  UpdateFilterSuccess({
    required WarrantyState state,
    this.newStore,
  }) : super(
          page: state.page,
          limit: state.limit,
          warrantiesNote: state.warrantiesNote,
          warranties: state.warranties,
          canLoadMore: state.canLoadMore,
          storeSelected: newStore ?? state.storeSelected,
        );
}

final class UpdateListWarrantiesSuccess extends WarrantyState {
  UpdateListWarrantiesSuccess({
    required WarrantyState state,
    required super.warranties,
    int? newPage,
    int? newLimit,
    required super.canLoadMore,
  }) : super(
          page: newPage ?? state.page,
          limit: newLimit ?? state.limit,
          warrantiesNote: state.warrantiesNote,
          storeSelected: state.storeSelected,
        );
}

final class GetWarrantyDetailSuccess extends WarrantyState {
  final WarrantyModel warranty;

  GetWarrantyDetailSuccess({
    required WarrantyState state,
    required this.warranty,
  }) : super(
          page: state.page,
          limit: state.limit,
          warrantiesNote: state.warrantiesNote,
          warranties: state.warranties,
          canLoadMore: state.canLoadMore,
          storeSelected: state.storeSelected,
        );
}
