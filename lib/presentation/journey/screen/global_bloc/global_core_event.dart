part of 'global_core_bloc.dart';

@immutable
sealed class GlobalCoreEvent {}

final class GetOrderStatusEvent extends GlobalCoreEvent {}

final class GetOrderSourceEvent extends GlobalCoreEvent {}

final class GetTicketTypeEvent extends GlobalCoreEvent {}
