import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:productsapp/models/product_list_response/product.dart';
import 'package:productsapp/widgets/product_grid.dart';
import 'package:productsapp/widgets/section_header.dart';

Widget productsView(List<Product> products) {
  final groupedProducts = products.groupListsBy((product) => product.category);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: groupedProducts.entries.map((entry) {
      final category = entry.key;
      final products = entry.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionHeader(category.toString().toUpperCase()),
          const SizedBox(height: 15),
          productGrid(products),
          const SizedBox(height: 30),
        ],
      );
    }).toList(),
  );
}
