import 'package:elevate_flutter_task/business_logic/products_bloc/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteView extends StatelessWidget {
  final double? top, right;
  final double? left;
  const FavouriteView({Key? key, this.top = 15, this.right = 15, this.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsCubit cubit = ProductsCubit.get(context);
    return Positioned(
      top: top,
      right: right,
      left: left,
      child: CircleAvatar(
          radius: 12.sp,
          backgroundColor: Colors.white,
          child: Icon(Icons.favorite_border, color: Colors.blue, size: 16.sp)),
    );
  }
}
