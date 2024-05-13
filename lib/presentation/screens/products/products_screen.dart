import 'package:ecommerce_app/core/DI/di.dart';
import 'package:ecommerce_app/core/reusable_components/product_widget.dart';
import 'package:ecommerce_app/domain/entities/Subcategory.dart';
import 'package:ecommerce_app/presentation/screens/products/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductsScreen extends StatelessWidget {
  static const String route = "products screen";

  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SubcategoryEntity categoryEntity =
        ModalRoute.of(context)?.settings.arguments as SubcategoryEntity;

    return Scaffold(
        appBar: AppBar(
          leading: Container(
              margin: REdgeInsets.only(left: 20),
              child: SvgPicture.asset("assets/svg/logo_svg.svg")),
          toolbarHeight: 50.h,
          leadingWidth: 90.w,
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          actions: [
            Container(
                margin: REdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  "assets/svg/shopping_cart.svg",
                  width: 20.w,
                ))
          ],
        ),
        body: BlocProvider(
          create: (context) => getIt<ProductsBySubcategoryIdViewModel>()
            ..getProducts(categoryEntity.id ?? ""),
          child: BlocBuilder<ProductsBySubcategoryIdViewModel,
              ProductsBySubcategoryIdState>(
            builder: (context, state) {
              if (state is ProductsBySubcategoryIdErrorState) {
                return IconButton(
                    onPressed: () {
                      getIt<ProductsBySubcategoryIdViewModel>()
                          .getProducts(categoryEntity.id ?? "");
                    },
                    icon: Icon(
                      Icons.refresh,
                      color: Theme.of(context).colorScheme.primary,
                      size: 100.sp,
                    ));
              }
              if (state is ProductsBySubcategoryIdSuccessState) {
                return state.productsList!.isNotEmpty
                    ? GridView.builder(
                  padding: REdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: .67),
                  itemBuilder: (context, index) =>
                      ProductWidget(productEntity: state.productsList![index]),
                  itemCount: state.productsList?.length,
                )
                    : const Center(child: Text("No items founded"),)



                ;
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
