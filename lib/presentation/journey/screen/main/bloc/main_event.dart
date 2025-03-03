part of 'main_bloc.dart';

sealed class MainEvent {}

final class ChangeTabEvent extends MainEvent {
  final TabIndex tabIndex;

  ChangeTabEvent({required this.tabIndex});
}
