import 'package:equatable/equatable.dart';
// part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductsEvent {}

class RefreshProductsEvent extends ProductsEvent {}

class GetProductDetailsEvent extends ProductsEvent {
  final int productId;

  GetProductDetailsEvent({required this.productId});
  List<Object> get props => [productId];
}
