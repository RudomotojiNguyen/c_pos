part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

final class InternetConnected extends InternetState {
  final ConnectivityResult connectionType;

  InternetConnected(this.connectionType);
}

final class InternetDisconnected extends InternetState {}
