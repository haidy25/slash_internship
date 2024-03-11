// import 'dart:html' as http;
import 'package:http/http.dart' as http;
import 'package:slash_internship/core/error/exception.dart';
import 'package:slash_internship/features/products/data/models/product_model.dart';
import 'package:slash_internship/features/products/data/models/product_variant_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductVariationModel>> getProductDetails(int productId);
}

const Base_URL = "https://slash-backend.onrender.com";

class ProductRemoteDataSourceImplementation implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImplementation({required this.client});
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(
      Uri.parse(Base_URL + "/product/?limit=20&page=1"),
    );
    if (response.statusCode == 200) {
      return ProductModel.jsonToList(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductVariationModel>> getProductDetails(int productId) async {
    final response = await client.get(
      Uri.parse(Base_URL + "/product/${productId.toString()}"),
    );
    if (response.statusCode == 200) {
      return ProductVariationModel.jsonToList(response.body);
    } else {
      throw ServerException();
    }
  }
}
