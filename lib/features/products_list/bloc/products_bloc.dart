import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:productsapp/models/product_list_response/product.dart';
import 'package:productsapp/models/product_list_response/product_list_response.dart';
import 'package:productsapp/repository/api_services.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState()) {
    on<FetchProductsEvent>(_fetchProducts);
  }
  final ApiServices _apiServices = ApiServices();

  Future<void> _fetchProducts(FetchProductsEvent event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final ProductListResponse? data = await _apiServices.fetchProductList();
      if (data != null) {
        final List<Product>? products = data.products;
        if (products != null && products.isNotEmpty) {
          emit(state.copyWith(products: products));
        }
      }
    } catch (e) {
      debugPrint("failed to fetch product list : $e");
      emit(state.copyWith(error: "No Data Found"));
    }
    emit(state.copyWith(isLoading: false));
  }
}
