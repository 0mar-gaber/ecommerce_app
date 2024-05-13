import 'package:ecommerce_app/core/utils/assets_manger.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
  ProductEntity productEntity ;

   ProductWidget({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.w,
      width: 191.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(.3),
            width: 2.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
          alignment: Alignment.bottomRight,
          children:[
            Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r),
                      ),
                      child: Image.network(
                        productEntity.imageCover ??
                            "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/2eff461f-f3ac-4285-9c6a-2f22173aac42/custom-nike-air-force-1-low-by-you.png",
                        fit: BoxFit.fill,
                        height: 180.h,
                        width: 200.w,
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetsManger.wishlistIconSelected,
                        width: 30.w,
                        height: 30.h,
                      ),
                    )
                  ],
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  margin: REdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    productEntity.slug ?? "omar",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  margin: REdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        "EGP ${productEntity.price}",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(width: 16.w),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  margin: REdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        "Review (${productEntity.ratingsAverage}) ",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SvgPicture.asset(
                        AssetsManger.starIcon,
                        width: 15.w,
                        height: 15.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: REdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/svg/add_icon.svg",width: 30.w,height: 30.h,),
            ),

          ]),
    );
  }
}
