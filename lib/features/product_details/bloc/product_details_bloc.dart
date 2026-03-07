import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:productsapp/models/product_list_response/product_details/product_details.dart';
import 'package:productsapp/repository/api_services.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsState()) {
    on<FetchProductDetailsEvent>(_fetchProductDetails);
  }
  final ApiServices _apiServices = ApiServices();

  Future<void> _fetchProductDetails(FetchProductDetailsEvent event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final ProductDetails? data = await _apiServices.fetchProductDetails(event.productId);
      if (data != null) {
        print("???????????????????????????????????????????????????????????????????");
        emit(state.copyWith(product: data));
      }
    } catch (e) {
      debugPrint("failed to fetch product list : $e");
      emit(state.copyWith(error: "No Data Found"));
    }
    emit(state.copyWith(isLoading: false));
  }
}
