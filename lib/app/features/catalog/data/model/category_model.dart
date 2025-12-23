import 'package:suaka_niaga/app/features/catalog/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.sku,
    required super.category,
  });

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, sku: sku, category: category);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      sku: json['sku'],
      category: json['category'],
    );
  }
}
