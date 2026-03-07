import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:productsapp/repository/api_services.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc() : super(UpdateProductState()) {
    on<CallUpdateProductEvent>(_updateProduct);
  }

  final ApiServices _apiServices = ApiServices();

  Future<void> _updateProduct(CallUpdateProductEvent event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _apiServices.updateProduct(
        productId: event.productId,
        title: event.title,
        price: event.price,
        description: event.description,
      );
      if (response) {
        emit(state.copyWith(isUpdated: true));
      }
    } catch (e) {
      debugPrint("failed to update : $e");
      emit(state.copyWith(error: "Failed to update"));
    }
    emit(state.copyWith(isLoading: false));
  }
}
