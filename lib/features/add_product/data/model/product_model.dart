import 'dart:io';

import 'package:fruit_hup_dashboard/features/add_product/data/model/review_model.dart';
import 'package:fruit_hup_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int nomberOfCalories;
  final num averageRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    this.sellingCount = 0,
    required this.reviews,
    required this.expirationMonths,
    required this.nomberOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.isOrganic = false,
    this.imageUrl,
  });

  factory ProductModel.fromEntity(ProductEntity addProductInputEntity) {
    return ProductModel(
      reviews:
          addProductInputEntity.reviews
              .map((e) => ReviewModel.fromEntity(e))
              .toList(),
      isOrganic: addProductInputEntity.isOrganic,
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expirationMonths: addProductInputEntity.expirationMonths,
      nomberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
    );
  }

  tojson() {
    return {
      'sellingCount': sellingCount,
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'nomberOfCalories': nomberOfCalories,
      'unitAmount': unitAmount,
      ' isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.tojson()).toList(),
    };
  }
}
