import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/DI/di.dart';
import 'package:ecommerce_app/core/utils/assets_manger.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/home_tab/view_models/brands_view_model.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/home_tab/view_models/categories_view_model.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/home_tab/view_models/most_selling_view_model.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/home_tab/widgets/ads_widget.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/home_tab/widgets/category_widget.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/home_tab/widgets/prand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/reusable_components/product_widget.dart';

class HomeTab extends StatelessWidget {
    HomeTab({super.key});

  List<String> ads = [
    AssetsManger.ad1,
    AssetsManger.ad3,
    AssetsManger.ad2,

  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: AppBar(
          leading: Container(
              margin: REdgeInsets.only(left: 20),
              child: SvgPicture.asset("assets/svg/logo_svg.svg")),
          leadingWidth: 90.w,
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          actions: [
            Container(
                margin: REdgeInsets.only(right: 20),
                child: SvgPicture.asset("assets/svg/shopping_cart.svg",width: 20.w,))
          ],
        ),),
        SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        SliverToBoxAdapter(
          child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => AdsWidget(adUrl: ads[index],),
              options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1
              )
          ),
        ),
        SliverToBoxAdapter(child:Container(
          padding: REdgeInsets.all(16),
          child: Text("Categories",style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500
          ),),
        ) ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 270.h,
            child: BlocProvider(
              create: (context) => getIt<CategoriesViewModel>()..gelAllCategories(),
              child:BlocBuilder<CategoriesViewModel,CategoriesState>(
                builder: (context, state) {
                  if(state is CategoriesErrorState){
                    return IconButton(
                        onPressed: () {
                          getIt<CategoriesViewModel>().gelAllCategories();
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: Theme.of(context).colorScheme.primary,
                          size: 100.sp,
                        ));
                  }
                  if(state is CategoriesSuccessState){
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.h,
                        mainAxisSpacing: 16.w,
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) => CategoryWidget( categoryEntity:  state.categoryList![index],),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categoryList?.length,
                      padding: REdgeInsets.only(
                          left: 14,
                          right: 14
                      ),

                    );
                  }
                  return  const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ) ,
            )
          ),
        ),
        SliverToBoxAdapter(child:Container(
          padding: REdgeInsets.all(16),
          child: Text("Brands",style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500
          ),),
        ) ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 130.h,
            child: BlocProvider(
              create: (context) => getIt<BrandViewModel>()..getAllBrands(),
              child: BlocBuilder<BrandViewModel,BrandState>(
                builder: (context, state) {
                  if(state is BrandErrorState){
                    print(state.errorMessage);
                    return IconButton(
                        onPressed: () {
                          getIt<CategoriesViewModel>().gelAllCategories();
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: Theme.of(context).colorScheme.primary,
                          size: 100.sp,
                        ));
                  }

                  if(state is BrandSuccessState){
                    return ListView.separated(
                      itemBuilder: (context, index) => BrandWidget(brandEntity: state.brandsList![index],),
                      separatorBuilder: (context, index) => SizedBox(width: 16.w,),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.brandsList!.length,

                    );
                  }

                  return  const Center(
                    child: CircularProgressIndicator(),
                  );


                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child:Container(
          padding: REdgeInsets.all(16),
          child: Text("Most Selling",style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500
          ),),
        ) ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 265.h,
            child: BlocProvider(
              create: (context) => getIt<MostSellingProductsViewModel>()..getMostSellingProduct(),
              child: BlocBuilder<MostSellingProductsViewModel,MostSellingProductsState>(
                builder: (context, state) {
                  if(state is MostSellingProductsSuccessState){
                    return ListView.separated(
                      itemBuilder: (context, index) =>  ProductWidget(productEntity: state.productsList![index],),
                      separatorBuilder: (context, index) => SizedBox(width: 16.w,),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.productsList!.length,
                      padding: REdgeInsets.only(
                          left: 14,
                          right: 14,
                          bottom: 10
                      ),

                    );
                  }
                  if(state is MostSellingProductsErrorState){
                    print(state.errorMessage);
                    return IconButton(
                        onPressed: () {
                          getIt<CategoriesViewModel>().gelAllCategories();
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: Theme.of(context).colorScheme.primary,
                          size: 100.sp,
                        ));
                  }
                  return  const Center(
                    child: CircularProgressIndicator(),
                  );

                },
              ),
            ),
          ),
        )


      ],
    );
  }


}
