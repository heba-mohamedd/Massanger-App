part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}


final class ProductError extends ProductState {
  final String errorMessage;
  ProductError(this.errorMessage);
}


final class ProductSuccess extends ProductState {
  final ProductsModel? productsModel;
  ProductSuccess(this.productsModel);
}
