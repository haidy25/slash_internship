import 'package:equatable/equatable.dart';
import 'package:slash_internship/features/products/domain/entities/brand.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final Brand brand;
  final String? brandName;
  final String? brandLogo;
  final double rating;

  Product(this.id, this.name, this.description, this.brandId, this.brand,
      this.brandName, this.brandLogo, this.rating);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, description, brandId, brand, brandName, brandLogo, rating];
}
