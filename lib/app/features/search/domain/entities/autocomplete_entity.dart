enum AutocompleteType { keyword, category, product }

class AutocompleteEntity {
  final String title;
  final AutocompleteType type;

  const AutocompleteEntity({required this.title, required this.type});
}
