part of '../company_services.dart';

class CompanyServicesImpl implements CompanyServices {
  final CompanyApi companyApi;

  CompanyServicesImpl({required this.companyApi});

  @override
  Future<List<CompanyModel>> getCompanies() {
    return companyApi.getCompanies().then(
      (value) {
        List<CompanyModel> data = [];
        for (var company in value.data) {
          data.add(CompanyModel.fromJson(company));
        }
        return data;
      },
    );
  }
}
