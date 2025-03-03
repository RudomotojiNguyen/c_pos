import '../datasources/remote/support_api.dart';
import '../models/ticket_model.dart';
import '../models/ticket_type_model.dart';

part 'impl/support_services_impl.dart';

abstract class SupportServices {
  Future<List<TicketModel>> getTicketList({
    required int page,
    required int limit,
    int? status,
  });

  Future<TicketModel> getTicketDetail({required int id});

  Future<List<TicketTypeModel>> getTicketTypes();

  Future<bool> saveSupportTicket({required Map<String, dynamic> params});

  Future<bool> remindTicket({required Map<String, dynamic> params});
}
