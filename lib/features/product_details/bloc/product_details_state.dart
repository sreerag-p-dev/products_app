part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final ProductDetails? product;
  final bool isLoading;
  final String? error;
  const ProductDetailsState({this.product, this.isLoading = false, this.error});

  ProductDetailsState copyWith({
    ProductDetails? product,
    bool? isLoading,
    String? error,
  }) {
    return ProductDetailsState(
      product: product ?? this.product,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [product, isLoading, error];
}
