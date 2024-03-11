import 'package:slash_internship/features/products/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:slash_internship/features/products/domain/entities/product_variations.dart';
import '../../../../core/error/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, ProductVariations>> getProductDetails(int productId);
}
