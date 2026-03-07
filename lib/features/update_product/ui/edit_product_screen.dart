import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productsapp/features/update_product/bloc/update_product_bloc.dart';
import 'package:productsapp/models/product_list_response/product_details/product_details.dart';

class EditProductScreen extends StatefulWidget {
  final ProductDetails product;

  const EditProductScreen({super.key, required this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.product.title);
    priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
    descriptionController = TextEditingController(
      text: widget.product.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateProductBloc(),
      child: BlocListener<UpdateProductBloc, UpdateProductState>(
        listenWhen: (previous, current) =>
            previous.isUpdated != current.isUpdated,
        listener: (context, state) {
          if (state.isUpdated != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.isUpdated!
                      ? "Product updated successfully"
                      : "Failed to update product",
                ),
              ),
            );

            if (state.isUpdated!) {
              Navigator.pop(context);
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Edit Product")),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Product Image
                    Center(
                      child: Image.network(
                        widget.product.thumbnail ?? "",
                        height: 200,
                      ),
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: "Title"),
                      validator: (value) =>
                          value!.isEmpty ? "Enter title" : null,
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: "Price"),
                      validator: (value) =>
                          value!.isEmpty ? "Enter price" : null,
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: "Description",
                      ),
                    ),

                    const SizedBox(height: 40),

                    BlocSelector<UpdateProductBloc, UpdateProductState, bool>(
                      selector: (state) {
                        return state.isLoading;
                      },
                      builder: (context, loading) {
                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: loading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<UpdateProductBloc>().add(
                                        CallUpdateProductEvent(
                                          productId: widget.product.id
                                              .toString(),
                                          title: titleController.text,
                                          price: priceController.text,
                                          description:
                                              descriptionController.text,
                                        ),
                                      );
                                    }
                                  },
                            child: loading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text("Update Product"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
