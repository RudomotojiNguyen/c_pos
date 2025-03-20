part of 'warranty_bloc.dart';

@immutable
sealed class WarrantyEvent {}

class GetSuggestNoteEvent extends WarrantyEvent {}

class SearchSuggestNoteEvent extends WarrantyEvent {
  final String name;

  SearchSuggestNoteEvent(this.name);
}

class UpdateFilterEvent extends WarrantyEvent {
  final StoreModel? store;

  UpdateFilterEvent({this.store});
}

class GetWarrantiesEvent extends WarrantyEvent {}

class GetMoreWarrantiesEvent extends WarrantyEvent {}

class GetWarrantyDetailEvent extends WarrantyEvent {
  final int id;
  final WarrantyModel? detail;

  GetWarrantyDetailEvent({
    required this.id,
    this.detail,
  });
}
