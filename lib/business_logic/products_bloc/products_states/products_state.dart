abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsSuccessState extends ProductsState {}

class GetProductsState extends ProductsState {}

class ProductsFailureState extends ProductsState {
  final String errorMessage;
  ProductsFailureState(this.errorMessage);
}
