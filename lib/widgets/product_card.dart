import 'package:flutter/material.dart';
import 'package:productsapp/models/product_list_response/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Favorite Icon
          const Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border),
          ),

          const SizedBox(height: 10),

          /// Product Image
          Center(child: Image.network(product.thumbnail ?? '', height: 80)),

          const SizedBox(height: 10),

          /// Product Name
          Text(
            product.title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          /// Description
          Text(
            product.description ?? '',
            style: TextStyle(fontSize: 10, color: Colors.black),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 10),

          /// Price
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
