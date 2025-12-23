import 'package:suaka_niaga/app/features/testing/domain/entities/testing_entity.dart';

class TestingModel extends TestingEntity {
  const TestingModel({
    required super.id,
    required super.title,
    required super.price,
    required super.rating,
    required super.stocks,
    required super.brand,
    required super.description,
  });

  TestingEntity toEntity() {
    return TestingEntity(
      id: id,
      title: title,
      description: description,
      price: price,
      rating: rating,
      stocks: stocks,
      brand: brand,
    );
  }

  factory TestingModel.fromJson(Map<String, dynamic> json) {
    return TestingModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      rating: json['rating'] ?? 0,
      stocks: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
