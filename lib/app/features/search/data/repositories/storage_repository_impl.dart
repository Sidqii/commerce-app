import 'package:shared_preferences/shared_preferences.dart';
import 'package:suaka_niaga/app/features/search/domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  static const _key = 'search_history';
  static const _limit = 5;
  final SharedPreferences preferences;

  const StorageRepositoryImpl(this.preferences);

  @override
  List<String> load() {
    return preferences.getStringList(_key) ?? [];
  }

  @override
  Future<void> save(String keyword) async {
    final history = load();

    history.remove(keyword);

    history.insert(0, keyword);

    if (history.length > _limit) {
      history.removeRange(_limit, history.length);
    }

    await preferences.setStringList(_key, history);
  }

  @override
  Future<void> clear() async {
    await preferences.remove(_key);
  }
}
