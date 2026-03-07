part of 'update_product_bloc.dart';

class UpdateProductState extends Equatable {
  final bool isLoading;
  final bool? isUpdated;
  final String? error;
  const UpdateProductState({
    this.isLoading = false,
    this.isUpdated,
    this.error,
  });

  UpdateProductState copyWith({
    bool? isLoading,
    bool? isUpdated,
    String? error,
  }) {
    return UpdateProductState(
      isLoading: isLoading ?? this.isLoading,
      isUpdated: isUpdated ?? this.isUpdated,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isUpdated, error];
}
