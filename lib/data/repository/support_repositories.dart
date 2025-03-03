import '../models/ticket_model.dart';
import '../models/ticket_type_model.dart';
import '../services/support_services.dart';

part 'impl/support_repositories_impl.dart';

abstract class SupportRepositories {
  Future<List<TicketModel>> getTicketList({
    required int page,
    required int limit,
    int? status,
  });

  Future<TicketModel> getTicketDetail({required int id});

  Future<List<TicketTypeModel>> getTicketTypes();

  Future<bool> saveSupportTicket({required Map<String, dynamic> params});

  Future<bool> remindTicket({required int id});
}
