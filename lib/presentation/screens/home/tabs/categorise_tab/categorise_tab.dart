import 'package:ecommerce_app/core/DI/di.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/categorise_tab/view_models/left_side_view_model.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/categorise_tab/view_models/right_side_view_model.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/categorise_tab/widgets/category_title.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/categorise_tab/widgets/sub_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../home_screen_provider.dart';

class CategoryTab extends StatelessWidget {
   CategoryTab({super.key});
  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeScreenProvider = Provider.of<HomeScreenProvider>(context);
    return Column(
      children: [
        AppBar(
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
        Expanded(
          child: Row(
            children: [
              Container(
                margin: REdgeInsets.only(
                  top: 16,
                  left: 16,
                ),
                width: 137.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(.1),
                  border: Border(
                    top: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.3),
                        width: 1.w),
                    bottom: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.3),
                        width: 1.w),
                    left: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.3),
                        width: 1.w),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                ),
                child: BlocProvider(
                  create:(context) => getIt<LeftSideViewModel>()..getCategorise(),
                  child: BlocBuilder<LeftSideViewModel,LeftSideState>(
                    builder: (context, state) {
                      if(state is LeftSideErrorState){
                        return IconButton(
                            onPressed: () {
                              getIt<LeftSideViewModel>().getCategorise();
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: Theme.of(context).colorScheme.primary,
                              size: 100.sp,
                            ));

                      }
                      if(state is LeftSideSuccessState){
                        return ListView.separated(
                          padding: REdgeInsets.only(bottom: 32,top:32),
                          itemBuilder: (context, index)  => InkWell(
                              onTap: () {
                                homeScreenProvider.changeCategory(index, state.categoriseList![index].id!);
                              },
                              child: homeScreenProvider.index== index
                                  ? CategoryTitle(categoryEntity: state.categoriseList![index], isSelected: true)
                                  : CategoryTitle(categoryEntity: state.categoriseList![index],isSelected: false)
                          ),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 48.h,
                            );
                          },
                          itemCount: state.categoriseList!.length,
                        );
                      }
                      return ListView.separated(
                        itemBuilder: (context, index)  => Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Theme.of(context).colorScheme.primary,
                            size: 20.sp,
                          ),
                        ),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 48.h,
                          );
                        },
                        itemCount: 18,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: REdgeInsets.only(
                   left: 24,
                   right: 16
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 13.h,),
                      Text("Men’s Fashion",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.textColor
                        ),
                      ),
                      Expanded(
                        child: BlocProvider.value(
                          value: getIt<RightSideViewModel>()..getSubCategorise(homeScreenProvider.id),
                          child: BlocBuilder<RightSideViewModel,RightSideState>(
                            builder: (context, state) {
                              if(state is RightSideErrorState){
                                return IconButton(
                                    onPressed: () {
                                      getIt<LeftSideViewModel>().getCategorise();
                                    },
                                    icon: Icon(
                                      Icons.refresh,
                                      color: Theme.of(context).colorScheme.primary,
                                      size: 100.sp,
                                    ));
                              }
                              if(state is RightSideSuccessState){
                                return GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 42.h,
                                      crossAxisSpacing: 14.w,
                                      childAspectRatio: 1

                                  ),
                                  itemBuilder: (context, index) {
                                    print(state.subCategoriseList!.length);
                                    if(state.subCategoriseList!.isNotEmpty){
                                      print("object");
                                      return SubCategory(subcategoryEntity: state.subCategoriseList![index],);
                                    }else {
                                      return Center(
                                        child: Column(
                                          children: [
                                            SvgPicture.asset("assets/svg/box.svg"),
                                            Text("coming soon",style: TextStyle(fontSize: 20.sp),)
                                          ],
                                        ),
                                      );                                    }
                                  },
                                  itemCount: state.subCategoriseList?.length,
                                );
                              }
                              return const Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
