import 'package:flutter/material.dart';

@immutable
class ProductsEntity {
  final int id;
  final String name;
  final int price;
  final int discount;
  final String slug;
  final String category;
  final String brand;
  final String vendor;
  final double rating;
  final int soldOut;
  final int stock;
  final String description;
  //nested object
  final Map<String, String> specs;
  final List<String> highlights;
  final List<String> media;

  const ProductsEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.slug,
    required this.category,
    required this.brand,
    required this.vendor,
    required this.rating,
    required this.soldOut,
    required this.stock,
    required this.description,
    required this.specs,
    required this.highlights,
    required this.media,
  });
}
