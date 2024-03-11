import 'package:equatable/equatable.dart';
import 'package:slash_internship/features/products/domain/entities/product_variant_images.dart';

class ProductVariations extends Equatable {
  final int id;
  final int productId;
  final double price;
  final int quantity;
  final bool isDefault;
  final List<ProductVariantImage> productVariantImages;

  ProductVariations(this.productId, this.id, this.price, this.quantity,
      this.isDefault, this.productVariantImages);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, productId, price, quantity, isDefault, productVariantImages];
}
