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
      width: 191.w,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(.3),width: 2.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children:[
              Container(
              height: 123.h,
              decoration: BoxDecoration(
                border: const Border.symmetric(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.r),
                  topRight: Radius.circular(13.r),
                ),
                image:  DecorationImage(
                    image: NetworkImage(productEntity.imageCover??""),
                    fit: BoxFit.fill,
                )
              ),),
              Padding(
                padding:  REdgeInsets.all(8.0),
                child: SvgPicture.asset(AssetsManger.wishlistIconSelected,width: 30.w,height: 30.h,),
              )
          ]),
          Container(
            alignment: AlignmentDirectional.topStart,
            margin: REdgeInsets.only(
              left: 8,
              top: 8
            ),
            child: Text(productEntity.slug??"",style: TextStyle(
              color: AppColors.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400
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
                Text("EGP ${productEntity.price}",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(width: 16.w,),
                // Text("2000 EGP",
                //
                //   style: TextStyle(
                //       decoration:  TextDecoration.lineThrough,
                //       color: Theme.of(context).colorScheme.primary.withOpacity(.6),
                //       fontSize: 14.sp,
                //       fontWeight: FontWeight.w400
                //   ),
                //   overflow: TextOverflow.ellipsis,
                //   maxLines: 2,
                // ),

              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
          margin: REdgeInsets.only(left: 8),
            child: Row(
              children: [
                Text("Review (${productEntity.ratingsAverage}) ",
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                
                SvgPicture.asset(AssetsManger.starIcon,width: 15.w,height: 15.h,)

              ],
            ),
          ),

        ],
      ),
    );
  }
}
