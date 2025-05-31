import '../datasources/remote/address_api.dart';
import '../models/address_model.dart';

part 'impl/address_services_impl.dart';

abstract class AddressServices {
  /// Get all cities
  Future<List<CityModel>> getCity();

  /// Get all districts by city id
  Future<List<DistrictModel>> getDistrict(String cityId);

  /// Get all wards by district id
  Future<List<WardModel>> getWard(String districtId);
}
