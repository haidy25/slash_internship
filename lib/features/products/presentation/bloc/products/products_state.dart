// part of 'products_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:slash_internship/features/products/domain/entities/product.dart';
import 'package:slash_internship/features/products/domain/entities/product_variations.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
  List<Object> get props => [];
}

final class ProductInitial extends ProductsState {}

//products loading in homepage
class LoadingProductState extends ProductsState {}

class LoadedProductsState extends ProductsState {
  final List<Product> products;
  LoadedProductsState({required this.products});
  List<Object> get props => [products];
}

class ErrorProductsState extends ProductsState {
  final String message;
  ErrorProductsState({required this.message});
  @override
  List<Object> get props => [message];
}

//product details events
class LoadingProductDetailsState extends ProductsState {}

class LoadedProductsDetailsState extends ProductsState {
  final List<ProductVariations> productDetails;
  LoadedProductsDetailsState({required this.productDetails});
  List<Object> get props => [productDetails];
}

class ErrorProductsDetailsState extends ProductsState {
  final String message;
  ErrorProductsDetailsState({required this.message});
  @override
  List<Object> get props => [message];
}
