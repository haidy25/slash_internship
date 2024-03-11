import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:slash_internship/features/products/domain/entities/product_variant_images.dart';

class ProductVariationsCard extends StatelessWidget {
  final String imageUrl;
  const ProductVariationsCard(
      {super.key,
      required this.imageUrl,
      required int id,
      required int productId,
      required double price,
      required List<ProductVariantImage> productVariantImages,
      required int quantity,
      required bool isDefault});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
