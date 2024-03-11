import 'package:equatable/equatable.dart';

class ProductVariantImage extends Equatable {
  final int id;
  final String imagePath;
  final int productVariantId;

  ProductVariantImage(this.id, this.imagePath, this.productVariantId);
  @override
  // TODO: implement props
  List<Object?> get props => [id, imagePath, productVariantId];
}
