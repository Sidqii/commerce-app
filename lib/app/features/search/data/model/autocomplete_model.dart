import 'package:suaka_niaga/app/features/search/domain/entities/autocomplete_entity.dart';

class AutocompleteModel extends AutocompleteEntity {
  const AutocompleteModel({required super.title, required super.type});

  factory AutocompleteModel.fromJson(Map<String, dynamic> json) {
    return AutocompleteModel(
      title: json['title'] as String,
      type: _mapType(json['type'] as String),
    );
  }

  static AutocompleteType _mapType(String value) {
    switch (value) {
      case 'keyword':
        return AutocompleteType.keyword;
      case 'category':
        return AutocompleteType.category;
      case 'product':
        return AutocompleteType.product;
      default:
        return AutocompleteType.keyword;
    }
  }
}
