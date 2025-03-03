part of '../support_repositories.dart';

class SupportRepositoriesImpl implements SupportRepositories {
  final SupportServices supportServices;

  SupportRepositoriesImpl({required this.supportServices});

  @override
  Future<TicketModel> getTicketDetail({required int id}) {
    return supportServices.getTicketDetail(id: id);
  }

  @override
  Future<List<TicketModel>> getTicketList(
      {required int page, required int limit, int? status}) {
    return supportServices.getTicketList(
        page: page, limit: limit, status: status);
  }

  @override
  Future<List<TicketTypeModel>> getTicketTypes() {
    return supportServices.getTicketTypes();
  }

  @override
  Future<bool> remindTicket({required int id}) {
    return supportServices.remindTicket(params: {'id': id});
  }

  @override
  Future<bool> saveSupportTicket({required Map<String, dynamic> params}) {
    return supportServices.saveSupportTicket(params: params);
  }
}
