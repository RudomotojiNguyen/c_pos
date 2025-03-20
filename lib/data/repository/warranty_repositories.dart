import '../models/suggest_note_model.dart';
import '../models/warranty_model.dart';
import '../services/warranty_services.dart';

part 'impl/warranty_repositories_impl.dart';

abstract class WarrantyRepositories {
  Future<List<SuggestNoteModel>> getWarrantyInfo({
    required int page,
    required int size,
    String? name,
  });

  Future<List<WarrantyModel>> getWarrantyList(
      {required int page, required int limit, List<int> storeIds = const []});
}
