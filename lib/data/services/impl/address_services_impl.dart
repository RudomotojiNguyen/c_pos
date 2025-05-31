part of '../address_services.dart';

class AddressServicesImpl extends AddressServices {
  final AddressApi addressApi;

  AddressServicesImpl({required this.addressApi});

  @override
  Future<List<CityModel>> getCity() async {
    final response = await addressApi.getCity();
    List<CityModel> cities = [];

    for (var city in response.data) {
      cities.add(CityModel.fromJson(city));
    }

    return cities;
  }

  @override
  Future<List<DistrictModel>> getDistrict(String cityId) async {
    final response = await addressApi.getDistrict(cityId);
    List<DistrictModel> districts = [];

    for (var district in response.data) {
      districts.add(DistrictModel.fromJson(district));
    }

    return districts;
  }

  @override
  Future<List<WardModel>> getWard(String districtId) async {
    final response = await addressApi.getWard(districtId);
    List<WardModel> wards = [];

    for (var ward in response.data) {
      wards.add(WardModel.fromJson(ward));
    }

    return wards;
  }
}
