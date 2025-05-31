part of '../address_repositories.dart';

class AddressRepositoriesImpl extends AddressRepositories {
  final AddressServices addressServices;

  AddressRepositoriesImpl({required this.addressServices});

  @override
  Future<List<CityModel>> getCity() async {
    return await addressServices.getCity();
  }

  @override
  Future<List<DistrictModel>> getDistrict(String cityId) async {
    return await addressServices.getDistrict(cityId);
  }

  @override
  Future<List<WardModel>> getWard(String districtId) async {
    return await addressServices.getWard(districtId);
  }
}
