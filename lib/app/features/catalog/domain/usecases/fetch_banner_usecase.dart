import 'package:suaka_niaga/app/features/catalog/domain/repositories/content_repository.dart';

class FetchBannerUsecase {
  final ContentRepository repository;

  FetchBannerUsecase(this.repository);

  Future<List<String>> call() {
    return repository.fetchBannerRepository();
  }
}
