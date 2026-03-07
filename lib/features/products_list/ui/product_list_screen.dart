import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productsapp/features/products_list/bloc/products_bloc.dart';
import 'package:productsapp/models/product_list_response/product.dart';
import 'package:productsapp/widgets/products_view.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc()..add(FetchProductsEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.menu),
                      Icon(Icons.shopping_cart_outlined),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Discover our exclusive products",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "In this marketplace, you will find various technics in the cheapest price",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  BlocSelector<
                    ProductsBloc,
                    ProductsState,
                    (List<Product>, bool)
                  >(
                    selector: (state) {
                      return (state.products, state.isLoading);
                    },
                    builder: (context, data) {
                      return data.$2
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  200,
                                  0,
                                  0,
                                ),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : productsView(data.$1);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
