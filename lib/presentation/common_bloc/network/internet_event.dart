part of 'internet_bloc.dart';

@immutable
sealed class InternetEvent {}

final class InternetCheckRequested extends InternetEvent {}

final class InternetStatusChanged extends InternetEvent {
  final ConnectivityResult result;

  InternetStatusChanged(this.result);
}
