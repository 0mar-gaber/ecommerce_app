import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/colors.dart';

class CategoryTitle extends StatelessWidget {
  CategoryEntity categoryEntity;
  bool isSelected ;
  CategoryTitle({super.key, required this.categoryEntity,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    if(isSelected == false){
      return  Padding(
        padding: REdgeInsets.only( left: 18),
        child: Text(
          categoryEntity.name??"",
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ),
      );
    }else{
      return Container(
        height: 120.h,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: REdgeInsets.all(5),
              width: 7.w,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20.r)
              ),
            ),
            SizedBox(width: 5.w,),
            Text(
               categoryEntity.name??"",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ],
        ),
      );
    }

  }
}
