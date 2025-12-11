import 'package:suaka_niaga/app/utils/data/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.media,
  });

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, media: media);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      media: json['media'] ?? '',
    );
  }
}
