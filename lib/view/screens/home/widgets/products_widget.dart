import 'package:elevate_flutter_task/business_logic/products_bloc/products_cubit/products_cubit.dart';
import 'package:elevate_flutter_task/business_logic/products_bloc/products_states/products_state.dart';
import 'package:elevate_flutter_task/view/base/custom_image.dart';
import 'package:elevate_flutter_task/view/base/favourite_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsWidget extends StatelessWidget {
  ProductsCubit? cubit;

  ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
        builder: (context, state) {
          cubit = BlocProvider.of<ProductsCubit>(context);
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 9,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6.sp),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 10.sp,
                              backgroundColor: Colors.purple,
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 4.sp),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10.sp),
                                    child: CustomImage(
                                      image: cubit!.list[index].image,
                                      fit: BoxFit.contain,
                                      width: 150.sp,
                                      height: 110.sp,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6.sp),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: CircleAvatar(
                                        radius: 10.sp,
                                        backgroundColor: Colors.white54,
                                        child: const FavouriteView(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Text(
                                cubit!.list[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  color: Colors.blue,
                                ),
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: 3.sp,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'EGP ',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    cubit!.list[index].price,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.sp,
                                  ),
                                  const Text(
                                    '2000',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Review(${cubit!.list[index].rating})',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    width: 3.sp,
                                  ),
                                  const Icon(
                                    Icons.star_rate,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: cubit!.list.length,
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
