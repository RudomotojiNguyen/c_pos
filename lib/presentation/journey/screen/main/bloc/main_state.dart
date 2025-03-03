part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  final TabIndex tabIndex;

  const MainState({
    required this.tabIndex,
  });

  @override
  List<Object?> get props => [tabIndex];
}

final class MainInitial extends MainState {
  const MainInitial({required super.tabIndex});
}

final class UpdateInTabSelect extends MainState {
  UpdateInTabSelect({
    required MainState state,
    required super.tabIndex,
  }) : super();
}
