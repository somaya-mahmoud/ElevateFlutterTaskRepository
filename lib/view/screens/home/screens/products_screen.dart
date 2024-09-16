import 'package:elevate_flutter_task/view/screens/home/widgets/products_widget.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsWidget(),
    );
  }
}
