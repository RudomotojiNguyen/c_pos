part of 'setting_bloc.dart';

@immutable
sealed class SettingEvent {}

final class GetAppSettingEvent extends SettingEvent {}

final class GetFeatureFlagEvent extends SettingEvent {}
