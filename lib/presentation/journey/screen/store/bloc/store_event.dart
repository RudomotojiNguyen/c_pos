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

final class GetStoresByUserEvent extends StoreEvent {}
