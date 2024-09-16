import 'dart:convert';
import 'package:elevate_flutter_task/data/products.dart';
import 'package:http/http.dart' as http;
import 'package:elevate_flutter_task/business_logic/products_bloc/products_states/products_state.dart';
import 'package:elevate_flutter_task/data/model/response/ProductsResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  static ProductsCubit get(context) => BlocProvider.of(context);

  ProductsResponse? productsResponse;

  List<Products> list = [];

  getProducts() async {
    http.Response productsResponse =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    List productsList = jsonDecode(productsResponse.body);
    for (var element in productsList) {
      list.add(Products(
          id: element['id'].toString(),
          category: element['category'].toString(),
          rating: element['rating'].toString(),
          title: element['title'].toString(),
          description: element['description'].toString(),
          image: element['image'].toString(),
          price: element['price'].toString(),
          discount: element['discount'].toString()));

      emit(GetProductsState());
    }
  }
}
