import 'package:dartz/dartz.dart';
import 'package:slash_internship/core/error/exception.dart';
import 'package:slash_internship/core/error/failure.dart';
import 'package:slash_internship/core/network/network.dart';
import 'package:slash_internship/features/products/data/datasources/localdatasource.dart';
import 'package:slash_internship/features/products/data/datasources/remotedatasource.dart';
import 'package:slash_internship/features/products/domain/entities/product.dart';
import 'package:slash_internship/features/products/domain/entities/product_variations.dart';
import 'package:slash_internship/features/products/domain/repositories/repository.dart';

class ProductRepositoryImplmentation extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImplmentation(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      //check errors or exception
      try {
        final remoteProducts = await remoteDataSource.getAllProducts();
        //  after gathering all data from api , before returning them we have to cache them save in device(local data source)
        localDataSource.cacheProducts(remoteProducts);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getCachedProducts();
        return Right(localProducts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, ProductVariations>> getProductDetails(
      int productId) async {
    if (await networkInfo.isConnected) {
      //check errors or exception
      try {
        final remoteProductsdetails =
            await remoteDataSource.getProductDetails(productId);
        //  after gathering all data from api , before returning them we have to cache them save in device(local data source)
        localDataSource.cacheProductsDetails(remoteProductsdetails);
        return Right(remoteProductsdetails as ProductVariations);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProductsdetails =
            await localDataSource.getCachedProductDetails();
        return Right(localProductsdetails as ProductVariations);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
