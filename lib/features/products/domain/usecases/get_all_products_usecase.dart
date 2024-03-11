import 'package:dartz/dartz.dart';
import 'package:slash_internship/features/products/domain/repositories/repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

class GetAllProductsUsecase {
  final ProductRepository repository;

  GetAllProductsUsecase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}
