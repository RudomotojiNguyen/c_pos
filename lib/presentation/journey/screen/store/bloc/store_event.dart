part of 'store_bloc.dart';

@immutable
sealed class StoreEvent {}

final class GetStoreEvent extends StoreEvent {}

final class GetUserStoreCanChangeEvent extends StoreEvent {}

final class ChangeUserStoreEvent extends StoreEvent {
  final int targetStoreId;

  ChangeUserStoreEvent({
    required this.targetStoreId,
  });
}

final class GetExchangeHistoryEvent extends StoreEvent {}

final class GetMoreExchangeHistoryEvent extends StoreEvent {}

final class CreateTicketExchangeEvent extends StoreEvent {
  final int targetStoreId;
  final String description;

  CreateTicketExchangeEvent({
    required this.targetStoreId,
    required this.description,
  });
}
