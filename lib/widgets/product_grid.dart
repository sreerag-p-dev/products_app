import 'package:flutter/material.dart';
import 'package:productsapp/models/product_list_response/product.dart';
import 'package:productsapp/widgets/product_card.dart';

Widget productGrid(List<Product> products) {
  return SizedBox(
    height: 290,
    child: GridView.builder(
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    ),
  );
}
