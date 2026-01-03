import '../datasources/remote/api_remote.dart';
import '../models/company_model.dart';

part 'impl/company_services_impl.dart';

abstract class CompanyServices {
  Future<List<CompanyModel>> getCompanies();
}
