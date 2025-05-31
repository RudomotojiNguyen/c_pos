part of 'address_bloc.dart';

@immutable
sealed class AddressState extends Equatable {
  final List<CityModel> cities;
  final List<DistrictModel> districts;
  final List<WardModel> wards;

  const AddressState({
    required this.cities,
    required this.districts,
    required this.wards,
  });

  @override
  List<Object?> get props => [cities, districts, wards];
}

final class AddressInitial extends AddressState {
  AddressInitial() : super(cities: [], districts: [], wards: []);
}

final class GetCitiesSuccess extends AddressState {
  GetCitiesSuccess({
    required AddressState state,
    required super.cities,
  }) : super(
          districts: state.districts,
          wards: state.wards,
        );
}

final class GetDistrictsSuccess extends AddressState {
  GetDistrictsSuccess({
    required AddressState state,
    required super.districts,
  }) : super(
          cities: state.cities,
          wards: state.wards,
        );
}

final class GetWardsSuccess extends AddressState {
  GetWardsSuccess({
    required AddressState state,
    required super.wards,
  }) : super(
          cities: state.cities,
          districts: state.districts,
        );
}
