import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productsapp/features/product_details/bloc/product_details_bloc.dart';
import 'package:productsapp/features/update_product/ui/edit_product_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsBloc()
            ..add(FetchProductDetailsEvent(productId: widget.productId)),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state.product == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final product = state.product!;
          return Scaffold(
            appBar: AppBar(title: Text(product.title ?? "Product")),

            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Image
                  Center(
                    child: Image.network(product.thumbnail ?? "", height: 200),
                  ),

                  const SizedBox(height: 20),

                  /// Title
                  Text(
                    product.title ?? "",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Price
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(product.description ?? ""),

                  const SizedBox(height: 20),

                  Text("Category: ${product.category}"),
                  const SizedBox(height: 10),

                  Text("Rating: ${product.rating}"),
                  const SizedBox(height: 10),

                  Text("Stock: ${product.stock}"),
                  SizedBox(height: 30),

                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber, // button color
                        foregroundColor: Colors.black, // text color
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditProductScreen(product: product),
                          ),
                        );
                      },
                      child: const Text(
                        "Edit Product",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Bottom Edit Button
          );
        },
      ),
    );
  }
}
