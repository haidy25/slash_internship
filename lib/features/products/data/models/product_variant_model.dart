import 'dart:convert';

import 'package:slash_internship/features/products/domain/entities/product_variations.dart';
import 'package:slash_internship/features/products/domain/entities/product_variant_images.dart';

class ProductVariationModel extends ProductVariations {
  ProductVariationModel(
      {required int id,
      required int productId,
      required double price,
      required int quantity,
      required bool isDefault,
      required List<ProductVariantImage> productVariantImages})
      : super(id, productId, price, quantity, isDefault, productVariantImages);

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      id: json['id'],
      productId: json['productId'],
      price: json['price'],
      quantity: json['quantity'],
      isDefault: json['isDefault'],
      productVariantImages: json['productVariantImages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'price': price,
      'quantity': quantity,
      'isDefault': isDefault,
      'productVariantImages': productVariantImages,
    };
  }

  static List<ProductVariationModel> jsonToList(dynamic json) {
    final List<dynamic> jsonArray = json;
    return jsonArray
        .map((json) => ProductVariationModel.fromJson(json))
        .toList();
  }

  static String listToJson(List<ProductVariationModel> productVariants) {
    final List<Map<String, dynamic>> productJsonList = productVariants
        .map((productvariants) => productvariants.toJson())
        .toList();
    return jsonEncode(productJsonList);
  }
}
