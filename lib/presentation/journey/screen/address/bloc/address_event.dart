part of 'address_bloc.dart';

@immutable
sealed class AddressEvent {}

final class GetCitiesEvent extends AddressEvent {}

final class GetDistrictsEvent extends AddressEvent {
  final int cityId;

  GetDistrictsEvent({required this.cityId});
}

final class GetWardsEvent extends AddressEvent {
  final int districtId;

  GetWardsEvent({required this.districtId});
}
