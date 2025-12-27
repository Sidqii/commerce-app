abstract class StorageRepository {
  List<String> load();

  Future<void> save(String keyword);

  Future<void> clear();
}