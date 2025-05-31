import '../models/address_model.dart';
import '../services/address_services.dart';

part 'impl/address_repositories_impl.dart';

abstract class AddressRepositories {
  /// Get all cities
  Future<List<CityModel>> getCity();

  /// Get all districts by city id
  Future<List<DistrictModel>> getDistrict(String cityId);

  /// Get all wards by district id
  Future<List<WardModel>> getWard(String districtId);
}
