import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_internship/features/products/domain/entities/product_variations.dart';
import 'package:slash_internship/features/products/presentation/bloc/products/products_bloc.dart';
import 'package:slash_internship/features/products/presentation/bloc/products/products_state.dart';
import 'package:slash_internship/features/products/presentation/widgets/product_variations_card.dart';

import '../../domain/entities/product.dart';

class ProductPageDetails extends StatefulWidget {
  const ProductPageDetails({super.key, required int productId});

  @override
  State<ProductPageDetails> createState() => _ProductPageDetailsState();
}

class _ProductPageDetailsState extends State<ProductPageDetails> {
  List<ProductVariations> products = [];
  // int productId = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductsState>(builder: (context, state) {
      return isLoading
          ? const SliverToBoxAdapter(
              child: SizedBox(height: 100, child: CircularProgressIndicator()))
          : SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductVariationsCard(
                      id: products[index].id,
                      productId: products[index].productId,
                      price: products[index].price,
                      productVariantImages:
                          products[index].productVariantImages,
                      quantity: products[index].quantity,
                      isDefault: products[index].isDefault,
                      imageUrl:
                          products[index].productVariantImages[index].imagePath,
                    ));
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
            );
    }, listener: (context, state) {
      if (state is LoadingProductDetailsState) {
        setState(() {
          isLoading = true;
        });
      } else if (state is LoadedProductsDetailsState) {
        setState(() {
          isLoading = false;
        });
        products = state.productDetails;
      }
    });
  }
}
