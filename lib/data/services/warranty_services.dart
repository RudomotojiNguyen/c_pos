import '../datasources/remote/api_remote.dart';
import '../models/suggest_note_model.dart';
import '../models/warranty_model.dart';

part 'impl/warrant_services_impl.dart';

abstract class WarrantyServices {
  Future<List<SuggestNoteModel>> getWarrantyInfo({
    required int page,
    required int size,
    String? name,
  });

  Future<List<WarrantyModel>> getWarrantyList(
      {required int page, required int limit, List<int> storeIds = const []});
}
