import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import 'product_details_page.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;
  const ProductsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.brandName ?? ""),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductPageDetails(productId: product.id)));
            },
          );
        },
      ),
    );
  }
}
