import 'dart:convert';
import 'package:slash_internship/core/constants/shared_constants.dart';
import 'package:slash_internship/features/products/data/models/product_model.dart';
import 'package:slash_internship/features/products/data/models/product_variant_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<void> cacheProducts(List<ProductModel> productModel);
  Future<List<ProductVariationModel>> getCachedProductDetails();
  Future<void> cacheProductsDetails(
      List<ProductVariationModel> productVariation);
}

class ProductLocalDataSourceImplementation implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImplementation({required this.sharedPreferences});
  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    String productsJson = ProductModel.listToJson(products);
    await sharedPreferences.setString(CACHED_PRODUCTS, productsJson);
  }

  @override
  Future<void> cacheProductsDetails(
      List<ProductVariationModel> productsVariation) async {
    String productsDetailsJson =
        ProductVariationModel.listToJson(productsVariation);
    await sharedPreferences.setString(
        CACHED_PRODUCT_DETAILS, productsDetailsJson);
  }

  @override
  Future<List<ProductVariationModel>> getCachedProductDetails() {
    final productsDetailsJson =
        sharedPreferences.getString(CACHED_PRODUCT_DETAILS) ?? "";
    return Future.value(
        ProductVariationModel.jsonToList(jsonDecode(productsDetailsJson)));
  }

  @override
  Future<List<ProductModel>> getCachedProducts() {
    final productsJson = sharedPreferences.getString(CACHED_PRODUCTS) ?? "";
    return Future.value(ProductModel.jsonToList(jsonDecode(productsJson)));
  }
}
