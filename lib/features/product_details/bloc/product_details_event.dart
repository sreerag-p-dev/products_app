part of 'product_details_bloc.dart';

class ProductDetailsEvent {}

class FetchProductDetailsEvent extends ProductDetailsEvent {
  final String productId;

  FetchProductDetailsEvent({required this.productId});
}
