part of '../support_services.dart';

class SupportServicesImpl implements SupportServices {
  final SupportApi supportApi;

  SupportServicesImpl({required this.supportApi});

  @override
  Future<TicketModel> getTicketDetail({required int id}) {
    return supportApi.getTicketDetail(id: id).then((response) {
      final data = response.data;
      if (data.containsKey('dataset')) {
        final listData = data['dataset'] as List;
        if (listData.isNotEmpty) {
          return TicketModel.fromJson(listData.first);
        }
      }
      throw Exception('Dataset not found in response');
    });
  }

  @override
  Future<List<TicketModel>> getTicketList(
      {required int page, required int limit, int? status}) {
    return supportApi
        .getTicketList(page: page, limit: limit, status: status)
        .then((response) {
      final data = response.data;
      if (data.containsKey('dataset')) {
        final listData = data['dataset'] as List;
        return listData.map((item) => TicketModel.fromJson(item)).toList();
      }
      throw Exception('Dataset not found in response');
    });
  }

  @override
  Future<List<TicketTypeModel>> getTicketTypes() {
    return supportApi.getTicketTypes().then((response) {
      final data = response.data as List;
      return data.map((item) => TicketTypeModel.fromJson(item)).toList();
    });
  }

  @override
  Future<bool> remindTicket({required Map<String, dynamic> params}) {
    return supportApi.remindTicket(params).then((response) {
      return response.checkIsSuccess;
    });
  }

  @override
  Future<bool> saveSupportTicket({required Map<String, dynamic> params}) {
    return supportApi.saveSupportTicket(params).then((response) {
      return response.checkIsSuccess;
    });
  }
}
