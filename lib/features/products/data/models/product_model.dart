import 'dart:convert';

import 'package:slash_internship/features/products/domain/entities/product.dart';

import '../../domain/entities/brand.dart';

class ProductModel extends Product {
  ProductModel(
      {required int id,
      required String name,
      required String description,
      required int brandId,
      required Brand brand,
      required String brandName,
      required String brandLogo,
      required double rating})
      : super(id, name, description, brandId, brand, brandName, brandLogo,
            rating);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        brandId: json['brandId'],
        brand: json['brand'],
        brandName: json['brandName'],
        brandLogo: json['brandLogo'],
        rating: json['rating']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'brandId': brandId,
      'brand': brand,
      'brandName': brandName,
      'brandLogo': brandLogo,
      'rating': rating,
    };
  }

  static List<ProductModel> jsonToList(dynamic json) {
    final List<dynamic> jsonArray = json;
    return jsonArray.map((json) => ProductModel.fromJson(json)).toList();
  }

  static String listToJson(List<ProductModel> products) {
    final List<Map<String, dynamic>> productJsonList =
        products.map((product) => product.toJson()).toList();
    return jsonEncode(productJsonList);
  }
}
