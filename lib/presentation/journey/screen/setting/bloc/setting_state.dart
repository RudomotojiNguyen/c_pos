part of 'setting_bloc.dart';

@immutable
sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object?> get props => [];
}

final class SettingInitial extends SettingState {
  const SettingInitial();
}

///
// final class GetAppSettingSuccess extends SettingState {
//   GetAppSettingSuccess({
//     required SettingState state,
//     required super.appSettingModel,
//   }) : super(userFeatureFlag: state.userFeatureFlag);
// }

// final class GetAppSettingLoading extends SettingState {
//   GetAppSettingLoading({
//     required SettingState state,
//   }) : super(
//           userFeatureFlag: state.userFeatureFlag,
//           appSettingModel: state.appSettingModel,
//         );
// }

///
// final class GetFeatureFlagSuccess extends SettingState {
//   GetFeatureFlagSuccess({
//     required SettingState state,
//     required super.userFeatureFlag,
//   }) : super(appSettingModel: state.appSettingModel);
// }
