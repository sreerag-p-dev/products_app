part of 'update_product_bloc.dart';

class UpdateProductEvent {}

class CallUpdateProductEvent extends UpdateProductEvent {
  final String productId;
  final String title;
  final String price;
  final String description;

  CallUpdateProductEvent({
    required this.productId,
    required this.title,
    required this.price,
    required this.description,
  });
}
