import 'package:dartz/dartz.dart';
import 'package:slash_internship/features/products/domain/entities/product_variations.dart';
import 'package:slash_internship/features/products/domain/repositories/repository.dart';
import '../../../../core/error/failure.dart';

class GetProductDetailsUsecase {
  final ProductRepository repository;

  GetProductDetailsUsecase(this.repository);

  Future<Either<Failure, ProductVariations>> call(int productId) async {
    return await repository.getProductDetails(productId);
  }
}
