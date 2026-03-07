part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final List<Product> products;
  final bool isLoading;
  final String? error;

  const ProductsState({
    this.products = const [],
    this.isLoading = false,
    this.error,
  });

  ProductsState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, error];
}
