import 'dart:convert';

import 'package:slash_internship/features/products/domain/entities/product_variant_images.dart';

class ProductVariatImageModel extends ProductVariantImage {
  ProductVariatImageModel(
      {required int id,
      required String imagePath,
      required int productVariantId})
      : super(id, imagePath, productVariantId);

  factory ProductVariatImageModel.fromJson(Map<String, dynamic> json) {
    return ProductVariatImageModel(
      id: json['id'],
      imagePath: json['imagePath'],
      productVariantId: json['productVariantId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'productVariantId': productVariantId,
    };
  }

  static List<ProductVariatImageModel> jsonToList(dynamic json) {
    final List<dynamic> jsonArray = json;
    return jsonArray
        .map((json) => ProductVariatImageModel.fromJson(json))
        .toList();
  }

  static String listToJson(List<ProductVariatImageModel> productImages) {
    final List<Map<String, dynamic>> productJsonList =
        productImages.map((productimages) => productimages.toJson()).toList();
    return jsonEncode(productJsonList);
  }
}
