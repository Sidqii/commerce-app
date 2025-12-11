import 'package:flutter/material.dart';

@immutable
class CategoryEntity {
  final int id;
  final String name;
  final String media;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.media,
  });
}
